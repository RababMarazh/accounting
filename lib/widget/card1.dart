import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/constants/textestyle.dart';
import 'package:accountiong/widget/note_card.dart';
import 'package:accountiong/widget/richtext.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String position;
  final int money;
  final String name;
  final String notes;
  final String date; // Accept date as a formatted string

  Card1({
    super.key,
    required this.position,
    required this.money,
    required this.name,
    required this.notes,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.0), // Black border
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Richtext(part1: "موقع العمل: ", part2: position),
              Container(
                height: 1,
                color: secondery,
              ),
              // SizedBox(height: 5),
              Richtext(part1: 'المبلغ: ', part2: money.toString()),
              Container(
                height: 1,
                color: secondery,
              ),
              Richtext(part1: 'الجهه المستلمة: ', part2: name),
              Container(
                height: 1,
                color: secondery,
              ),
              Richtext(part1: 'التاريخ: ', part2: date),
              Container(
                height: 1,
                color: secondery,
              ),
              Richtext(part1: 'التفاصيل: ', part2: notes),
              Container(
                height: 1,
                color: secondery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
