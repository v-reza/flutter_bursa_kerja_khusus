import 'dart:convert';

import 'package:bursa_kerja/config/theme.dart';
import 'package:bursa_kerja/network/api.dart';
import 'package:bursa_kerja/pages/auth/masuk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String profileImage = "";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);
    var dataProfile = await Network().getData('/user/${user['users_id']}');
    var getDataProfile = json.decode(dataProfile.body);
    // print(user);
    print(getDataProfile['data'][0]['user_profile']['profile_image']);
    if (user != null) {
      setState(() {
        name = getDataProfile['data'][0]['user_profile']['nama'];
        profileImage =
            getDataProfile['data'][0]['user_profile']['profile_image'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 139),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    '${profileImage}',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - (2 * 60),
                child: RaisedButton(
                  onPressed: () {
                    _logout();
                  },
                  splashColor: Color(0xffFF4646),
                  color: Color(0xffFF4646),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${name}',
                        style: whiteTextStyle.copyWith(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async {
    var res = await Network().postDataWithToken('/logout');
    var body = json.decode(res.body);
    // print(body);
    if (body['error'] == false) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MasukPage()));
    }
  }
}
