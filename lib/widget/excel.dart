import 'package:flutter/material.dart';

Widget buildExcelRow(List<String> columns, {bool isHeader = false}) {
    return Row(
      children: columns.map((text) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 74, 73, 73)),
              color: isHeader ? Colors.grey[300] : const Color.fromARGB(255, 238, 244, 249),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isHeader?12: 10,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader?const Color.fromARGB(255, 34, 113, 178):Colors.black
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
