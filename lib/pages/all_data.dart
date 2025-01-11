import 'package:accountiong/constants/colors.dart';
import 'package:flutter/material.dart';

class AllData extends StatelessWidget {
  const AllData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor:light3,
     // const Color.fromARGB(255, 233, 231, 231),
      appBar: AppBar(
  backgroundColor: mainColor,
  title: Text(
    'لمسة للاعمال الهندسية',
    style: TextStyle(color: Colors.black,fontSize: 15),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0), // Add some padding around the image
      child: ClipOval(
        child: Image.asset(
          'assets/imgs/lamsah2.jpg',
          fit: BoxFit.cover, // Ensures the image scales properly
          width: 40.0, // Adjust the width and height to set the size
          height: 40.0,
        ),
      ),
    ),
  ],
),
    );
  }
}