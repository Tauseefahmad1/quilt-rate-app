import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';

class CommonTextField extends StatelessWidget {
  String hinttext, prefixicon;
  bool obsecure,enable;
  final controller;
  var validator;
  AutovalidateMode autovalidatemode;

  CommonTextField(
      {required this.hinttext,
      this.obsecure = false,
      this.enable=true,
      required this.controller,
      required this.prefixicon,
      this.validator,
      this.autovalidatemode = AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: .1,
                color: pageBackgroundColor,
                offset: Offset(1, 1))
          ],
          color: whitecolor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: TextFormField(
        enabled: enable,
        autovalidateMode: autovalidatemode,
        validator: validator,
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Container(
                  padding: EdgeInsets.all(6),
                  width: 25, height: 25, child: SvgPicture.asset(prefixicon,width: 25,height: 25,fit: BoxFit.fill,)),
          ),
          hintText: hinttext,
          contentPadding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
          hintStyle: const TextStyle(color: Color(0XFF999999)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CommonTextField2 extends StatelessWidget {
  String hinttext;
  bool obsecure;
  final controller;
  var validator;
  AutovalidateMode autovalidatemode;

  CommonTextField2(
      {required this.hinttext,
      this.obsecure = false,
      required this.controller,
      this.validator,
      this.autovalidatemode = AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 89,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: .1,
                color: pageBackgroundColor,
                offset: Offset(1, 1)),
            BoxShadow(
                blurRadius: .1,
                color: pageBackgroundColor,
                offset: Offset(-1, -1))
          ],
          color: whitecolor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0,),
            child: CommonTextpopp(
              text: "Title ",
              fontweight: FontWeight.w500,
              fontsize: 16,
              color: Color(0XFFAEAEB2),
              talign: TextAlign.start,
            ),
          ),
          TextFormField(
            autovalidateMode: autovalidatemode,
            validator: validator,
            controller: controller,
            obscureText: obsecure,
            decoration: InputDecoration(
              hintText: hinttext,
              contentPadding:
                  const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

class CommonTextField3 extends StatelessWidget {
  String hinttext;
  bool obsecure;
  final controller;
  var validator, ontap;
  AutovalidateMode autovalidatemode;

  CommonTextField3(
      {required this.hinttext,
      this.obsecure = false,
      required this.controller,
      this.validator,
      required this.ontap,
      this.autovalidatemode = AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: TextFormField(
        autovalidateMode: autovalidatemode,
        validator: validator,
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () async {
                controller.clear();
              },
              child: InkWell(
                onTap: ontap,
                child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(.6)),
                    child: Image.asset(
                      sendchaticon,
                      color: whitecolor,
                    )),
              )),
          hintText: hinttext,
          contentPadding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
          hintStyle: const TextStyle(color: Color(0XFF999999)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}


class CommonTextField4 extends StatelessWidget {
  String hinttext;
  int maxlines;
  bool obsecure,enable;
  final controller;
  var validator;
  AutovalidateMode autovalidatemode;

  CommonTextField4(
      {required this.hinttext,
      required this.maxlines,
      this.obsecure = false,
      this.enable=true,
      required this.controller,
      this.validator,
      this.autovalidatemode = AutovalidateMode.disabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: .1,
                color: pageBackgroundColor,
                offset: Offset(1, 1))
          ],
          color: whitecolor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: TextFormField(
        enabled: enable,
        autovalidateMode: autovalidatemode,
        maxLines: maxlines,
        validator: validator,
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hinttext,
          contentPadding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
          hintStyle: const TextStyle(color: Color(0XFF999999)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}