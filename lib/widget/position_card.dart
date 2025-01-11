import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/widget/richtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PositionCard extends StatelessWidget {
  QueryDocumentSnapshot data;
  Function() ontap;
  PositionCard({super.key, required this.data, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: secondery),
            borderRadius: BorderRadius.circular(16),
            // color: Colors.white,
            gradient: LinearGradient(
              colors: [mainColor, Colors.white, mainColor],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Richtext(part1: "موقع العمل: ", part2: data['name']),
              Container(
                width: 200,
                height: 1,
                color: secondery,
              ),
              Richtext(part1: " تاريخ الإنشاء: ", part2: data['createdAt']),
               Container(
                width: 200,
                height: 1,
                color: secondery,
              ),
              Richtext(part1: " المجموع: ", part2: data['sum'].toString()),
               Container(
                width: 200,
                height: 1,
                color: const Color.fromARGB(255, 164, 30, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
