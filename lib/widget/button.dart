import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/constants/textestyle.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Button extends StatelessWidget {
  Function() function;
  String text;
  Color? color;
  Button(
      {super.key,
      required this.text,
      required this.color,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.sizeOf(context).height/20,
        decoration: BoxDecoration(
          border: Border.all(color: secondery),
          gradient: LinearGradient(
            colors: [mainColor,light3,mainColor],
       
           
            ),


           
        
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: secondery,fontSize: 18)
          ),
        ),
      ),
    );
  }
}
