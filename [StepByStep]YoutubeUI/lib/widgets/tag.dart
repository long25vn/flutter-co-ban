import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  Tag(
      {this.title,
      this.labelColor,
      this.backgroundColor,
      });

  final String title;
  final int labelColor;
  final int backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: FilterChip(
        label: Text(title),
        labelStyle: TextStyle(color: Color(labelColor)),
        backgroundColor: Color(backgroundColor),
        shape: StadiumBorder(
            side: BorderSide(
          color: Color(0xFFCECECE),
          width: 0.5,
        )),
        onSelected: (bool value) {},
      ),
    );
  }
}
