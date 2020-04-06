import 'package:flutter/cupertino.dart';

Widget subject(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        width: 20,
        height: 20,
        color: Color(0xff5BBDF4),
      ),
      SizedBox(width: 10),
      Text(text),
    ],
  );
}
