import 'package:bursa_kerja/config/theme.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool password;
  var type;

  InputField(
      {this.hintText, this.controller, this.password = false, this.type});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 52,
        width: 288,
        decoration: BoxDecoration(
            border: Border.all(color: greyColor, width: 2.0),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            password
                ? Expanded(
                    child: TextFormField(
                      autofocus: false,
                      controller: controller,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: blackColor,
                      style: greyTextStyle.copyWith(fontSize: 17),
                      validator: (typeValue) {
                        if (typeValue!.isEmpty) {
                          return 'Please enter your ${type}';
                        }
                        type = typeValue;
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        hintText: hintText,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 0)),
                        hintStyle: greyTextStyle.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Expanded(
                    child: TextFormField(
                      autofocus: false,
                      controller: controller,
                      cursorColor: blackColor,
                      style: greyTextStyle.copyWith(fontSize: 17),
                      validator: (typeValue) {
                        if (typeValue!.isEmpty) {
                          return 'Please enter your ${type}';
                        }
                        type = typeValue;
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        hintText: hintText,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 0)),
                        hintStyle: greyTextStyle.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
