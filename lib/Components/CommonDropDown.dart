import 'package:flutter/material.dart';

class CommonDropDown extends StatelessWidget {
  String selectedText = '';
  List<String> listItem = [];
  var onchanged;
  double Width;

  CommonDropDown({
    required this.Width,
    required this.selectedText,
    required this.listItem,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: Width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.3),
      ),
      child:  Center(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text("Status"),
          value: selectedText,
          underline: Text(""),
          items: listItem.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                //   style: ktitleWhite14withOpacityStyle,
              ),
            );
          }).toList(),
          onChanged: onchanged,
        ),
      ),
    );
  }
}