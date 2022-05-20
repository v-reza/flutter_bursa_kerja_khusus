import 'package:bursa_kerja/config/theme.dart';
import 'package:bursa_kerja/pages/auth/masuk.dart';
import 'package:bursa_kerja/widgets/input_field.dart';
import 'package:flutter/material.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Daftar',
                          style: blackTextStyle.copyWith(fontSize: 42),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                        hintText: "NIS",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: "email@example.com",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: "Password",
                        password: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: "Konfirmasi Password",
                        password: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - (2 * 60),
                            child: RaisedButton(
                              onPressed: () {},
                              splashColor: blueColor,
                              color: blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Daftar',
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
                                    'Daftar dengan Google',
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
                              'Sudah punya akun?',
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
                                        builder: (context) => MasukPage()));
                              },
                              child: Text(
                                'Login',
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
              )
            ],
          )
        ]),
      ),
    );
  }
}
