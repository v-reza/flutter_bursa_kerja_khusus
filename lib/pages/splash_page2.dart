import 'package:bursa_kerja/config/theme.dart';
import 'package:bursa_kerja/pages/splash_page3.dart';
import 'package:flutter/material.dart';

class SplashPage2 extends StatelessWidget {
  const SplashPage2({Key? key}) : super(key: key);

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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/bottom_splash2.png',
                      width: 60,
                      height: 10,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashPage3()));
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
                  'Job Seeker',
                  style: blackTextStyle.copyWith(fontSize: 32),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Membantu anda sebagai\nalumni untuk mencari pekerjaan',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 67,
                ),
                Image.asset(
                  'assets/splash2.png',
                  width: 366,
                  height: 273,
                ),
                SizedBox(
                  height: 140,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
