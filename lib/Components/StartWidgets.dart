import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Controller/HomePage_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
import 'package:rate_my_quilt/Utils/Functions.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';

class StartReting extends StatefulWidget {
  double initialRating;
  String id;
  bool frombookmark;
  double itemsize;
  bool onbuttonadd;
  StartReting({
    required this.initialRating,
    required this.id,
    this.itemsize = 45,
    this.onbuttonadd = false,
    required this.frombookmark,
  });
  @override
  _StartRetingState createState() => _StartRetingState();
}

class _StartRetingState extends State<StartReting> {
  late double rrating;
  @override
  void initState() {
    super.initState();
    //ratingController = TextEditingController(text: '3.0');
    rrating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    final homepagecontroller =
        Provider.of<HomePage_Controller>(context, listen: false);
    return RatingStars(
      onValueChanged: (ratingn) async {
        print("objectobjectobjectobjectobjectobjectobject "+ratingn.toString());
          AssetsAudioPlayer.newPlayer().open(
          Audio("assets/audios/sound.wav"),
          autoStart: true,
          showNotification: true,
        );
        if (widget.onbuttonadd) {
          setState(() {
            print("objectobjectobjectobjectobjectobjectobject");
            rrating = ratingn;
            dialogboxsubmitratting = ratingn;
            widget.initialRating = ratingn;
          });
        } else {
          if (widget.frombookmark) {
          } else {
            double rr=double.parse(ratingn.toString())/9*15;
            print("objectobjectobjectobjectobjectobjectobject"+rr.toString());
            homepagecontroller.HitRatting(
                widget.id, rr.toString(), context);
            setState(() {
              //    print("objectobjectobjectobjectobjectobjectobject");
              rrating = ratingn;
            });
          }
        }
      },
      value: rrating,
      starCount: 5,
      starSize:widget.itemsize,
      maxValue: 3,
      starSpacing: 18,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      animationDuration: Duration(milliseconds: 1500),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: primaryColor,
    );

    // Builder(
    //   builder: (context) => Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       ratingBar(context),
    //       // Text(
    //       //   'Rating: $rrating',
    //       //   style: TextStyle(fontWeight: FontWeight.bold),
    //       // ),
    //     ],
    //   ),
    // );
  }

  Widget ratingBar(BuildContext context) {
    final homepagecontroller =
        Provider.of<HomePage_Controller>(context, listen: false);
    return RatingBar.builder(
      initialRating: widget.initialRating,
      minRating: 1,
      glow: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Color(0XFF910A8E).withAlpha(50),
      itemCount: 5,
      itemSize: widget.itemsize,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) {
        return Image.asset("assets/icons/starrattingicon.png");
        //  return Icon(
        //     Icons.abc,
        //     color: Color(0XFF910A8E),
        //   );
      },
      onRatingUpdate: (rating) {
        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/audios/sound.wav"),
          autoStart: true,
          showNotification: true,
        );
        if (widget.onbuttonadd) {
          setState(() {
            //print("objectobjectobjectobjectobjectobjectobject");
            rrating = rating;
            dialogboxsubmitratting = rating;
            widget.initialRating = rating;
          });
        } else {
          if (widget.frombookmark) {
          } else {
            homepagecontroller.HitRatting(
                widget.id, rating.toString(), context);
            setState(() {
              //    print("objectobjectobjectobjectobjectobjectobject");
              rrating = rating;
            });
          }
        }
      },
      ignoreGestures: widget.frombookmark,
      updateOnDrag: false,
    );
  }
}
