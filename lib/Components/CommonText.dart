import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextmeri extends StatelessWidget {
  String text;
  FontWeight fontweight;
  double fontsize;
  Color color;
  TextAlign talign;
  CommonTextmeri({
    required this.text,
    required this.fontweight,
    required this.fontsize,
    required this.color,
    this.talign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: talign,
      style:GoogleFonts.nunito( //GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: color,
                fontWeight: fontweight,
                fontSize: fontsize,
              ),
            )
    );
  }
}




class CommonTextOpen extends StatelessWidget {
  String text;
  FontWeight fontweight;
  double fontsize;
  Color color;
  TextAlign talign;
  CommonTextOpen({
    required this.text,
    required this.fontweight,
    required this.fontsize,
    required this.color,
    this.talign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: talign,
      style:GoogleFonts.nunito(//GoogleFonts.openSans(
              textStyle: TextStyle(
                color: color,
                fontWeight: fontweight,
                fontSize: fontsize,
              ),
            )
    );
  }
}



class CommonTextpopp extends StatelessWidget {
  String text;
  FontWeight fontweight;
  double fontsize;
  Color color;
  TextAlign talign;
  CommonTextpopp({
    required this.text,
    required this.fontweight,
    required this.fontsize,
    required this.color,
    this.talign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: talign,
      style:GoogleFonts.nunito(//GoogleFonts.poppins(
              textStyle: TextStyle(
                color: color,
                fontWeight: fontweight,
                fontSize: fontsize,
              ),
            )
    );
  }
}