import 'package:flutter/material.dart';


class StickyLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  const StickyLabel({
required    this.text,
  required  this.textColor,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 24,
        top: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
