import 'package:flutter/material.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/GradiendWidget.dart';

class CommonButton extends StatelessWidget {
  String title;
  var ontap;
  CommonButton({required this.title, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), gradient: horizontalgradientwidget),
        width: MediaQuery.of(context).size.width,
        height: 56,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextmeri(text: title, fontweight: FontWeight.w700, fontsize: 21, color: whitecolor),
                Image.asset(arrowforwardicon)
              ],
            ),
          )
        ),
      ),
    );
  }
}




class CommonButton2 extends StatelessWidget {
  String title;
  var ontap;
  bool redcolor;
  CommonButton2({
    this.redcolor=false,
    required this.title, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),color:redcolor? Colors.red:primaryColor),
        width: MediaQuery.of(context).size.width,
        height: 56,
        child: Center(
          child: CommonTextpopp(text: title, fontweight: FontWeight.w700, fontsize: 21, color: whitecolor),
        ),
      ),
    );
  }
}