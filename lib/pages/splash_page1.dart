import 'package:bursa_kerja/config/theme.dart';
import 'package:bursa_kerja/pages/splash_page2.dart';
import 'package:flutter/material.dart';

class SplashPage1 extends StatelessWidget {
  const SplashPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 61, right: 58),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/bottom_splash1.png',
                    width: 60,
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashPage2()));
                    },
                    child: Image.asset(
                      'assets/btn_next.png',
                      width: 66,
                      height: 66,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 85,
              left: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selamat Datang',
                  style: blackTextStyle.copyWith(fontSize: 32),
                ),
                SizedBox(
                  height: 135,
                ),
                Image.asset(
                  'assets/splash1.png',
                  width: 366,
                  height: 273,
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
