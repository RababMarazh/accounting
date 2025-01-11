import 'package:accountiong/constants/colors.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatefulWidget {
  final String notes;

  NotesCard({required this.notes});

  @override
  _NotesCardState createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Text(
            isExpanded ? widget.notes : _getTruncatedText(widget.notes),
            style: TextStyle(color: light1),
          ),
        ),
        if (!isExpanded && widget.notes.length > 50) // Show "Show more" only if truncation is applied
          GestureDetector(
            onTap: _toggleExpand,
            child: Text(
              '... Show more',
              style: TextStyle(color: darkColor),
            ),
          ),
      ],
    );
  }

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  String _getTruncatedText(String text) {
    return text.length > 50 ? text.substring(0, 50) + '...' : text;
  }
}
