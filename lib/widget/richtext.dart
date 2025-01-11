import 'package:accountiong/constants/textestyle.dart';
import 'package:flutter/material.dart';

class Richtext extends StatelessWidget {
  String part1;
  String part2;
   Richtext({super.key,required this.part1,required this.part2});

  @override
  Widget build(BuildContext context) {
    return RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text:part1, // The first part of the text
        style: Constants.blackB15(context), // Apply your desired style
      ),
      TextSpan(
        text: part2, // The name part
        style: TextStyle( // Apply a different style for the name
          fontSize: 14.0, // Example size
         // fontWeight: FontWeight.bold, // Example bold font
          color: Colors.black// Example color
        ),
      ),
    ],
  ),
);

  }
}