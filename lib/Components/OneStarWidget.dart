import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';

class OneStarWidget extends StatelessWidget {
  double starsize;
  OneStarWidget({required this.starsize});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingStars(
        value: 1,
        starCount: 1,
        starSize: starsize,
        valueLabelColor: Color(0xFFfc6011),
        valueLabelTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 12.0),
        valueLabelRadius: 10,
        maxValue: 1,
        starSpacing: 0,
        maxValueVisibility: false,
        valueLabelVisibility: false,
        animationDuration: Duration(milliseconds: 1000),
        valueLabelPadding:
            const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        valueLabelMargin: const EdgeInsets.only(right: 8),
        starOffColor: const Color(0xffe7e8ea),
        starColor: primaryColor,
      ),
    );
  }
}
