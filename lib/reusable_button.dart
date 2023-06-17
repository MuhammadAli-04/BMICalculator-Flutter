import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';

class ReusableButton extends StatelessWidget {
  const ReusableButton({super.key, required this.label, required this.onTap});

  final String label;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color : Colors.pink,
          height : 60.0,
          width: double.infinity,
          child : Center(
            child: Text(
                label.toUpperCase(),
                style : kBaseTextStyle
            ),
          )
      ),
    );
  }
}
