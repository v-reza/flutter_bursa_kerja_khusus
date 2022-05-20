import 'dart:convert';

import 'package:bursa_kerja/config/theme.dart';
import 'package:bursa_kerja/network/api.dart';
import 'package:bursa_kerja/pages/auth/daftar.dart';
import 'package:bursa_kerja/pages/main/home.dart';
import 'package:bursa_kerja/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasukPage extends StatefulWidget {
  const MasukPage({Key? key}) : super(key: key);

  @override
  State<MasukPage> createState() => _MasukPageState();
}

class _MasukPageState extends State<MasukPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var nis, email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: blueColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Image.asset('assets/bg_auth.png'),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo_putih.png'))),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width - (2 * 30),
                  height: MediaQuery.of(context).size.height / 2 + (2 * 120),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: whiteColor),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'Masuk',
                            style: blackTextStyle.copyWith(fontSize: 42),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(children: [
                          Center(
                            child: Container(
                              height: 52,
                              width: 288,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: greyColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    cursorColor: blackColor,
                                    style: greyTextStyle.copyWith(fontSize: 17),
                                    validator: (nisValue) {
                                      if (nisValue!.isEmpty) {
                                        return 'Please enter your NIS';
                                      }
                                      nis = nisValue;
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 15),
                                      hintText: "NIS",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      hintStyle: greyTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 52,
                              width: 288,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: greyColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    cursorColor: blackColor,
                                    style: greyTextStyle.copyWith(fontSize: 17),
                                    validator: (emailValue) {
                                      if (emailValue!.isEmpty) {
                                        return 'Please enter your Email';
                                      }
                                      email = emailValue;
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 15),
                                      hintText: "Email",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      hintStyle: greyTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 52,
                              width: 288,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: greyColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    cursorColor: blackColor,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style: greyTextStyle.copyWith(fontSize: 17),
                                    validator: (passwordValue) {
                                      if (passwordValue!.isEmpty) {
                                        return 'Please enter your Password';
                                      }
                                      password = passwordValue;
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 15),
                                      hintText: "Password",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: whiteColor, width: 0)),
                                      hintStyle: greyTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Container(
                              height: 60,
                              width:
                                  MediaQuery.of(context).size.width - (2 * 60),
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _login();
                                  }
                                },
                                splashColor: blueColor,
                                color: blueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  _isLoading ? 'Processing' : 'Masuk',
                                  textDirection: TextDirection.ltr,
                                  style: whiteTextStyle.copyWith(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            'ATAU',
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - (2 * 60),
                            child: RaisedButton(
                                onPressed: () {},
                                splashColor: whiteColor,
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Image.asset('assets/google.png'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Masuk dengan Google',
                                      style: greyTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 84),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Belum punya akun?',
                                style: greyTextStyle.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DaftarPage()));
                                },
                                child: Text(
                                  'Register',
                                  style: greyTextStyle.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'nis': nis,
      'email': email,
      'password': password,
      'role': 'guest'
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);
    if (body['error'] == false) {
      // print(body['data']['access_token']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'token', json.encode(body['data']['access_token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    } else {
      _showMsg(body["message"]);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
