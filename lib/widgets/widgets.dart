import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 24),
      children: <TextSpan>[
        TextSpan(
            text: 'CityTransfers',
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
        TextSpan(
            text: ' Cabs',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.purple)),
      ],
    ),
  );
}
