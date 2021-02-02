import 'package:flutter/material.dart';

Widget appBar12(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 24),
      children: <TextSpan>[
        TextSpan(
            text: 'Set',
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
        TextSpan(
            text: ' Destination',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.purple)),
      ],
    ),
  );
}
