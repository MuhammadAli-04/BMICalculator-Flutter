import 'package:flutter/material.dart';
import 'constants.dart';

class ChildGender extends StatelessWidget {
  final IconData icon;
  final String label;

  const ChildGender({super.key, required this.icon,required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size : 60.0
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
            label,
        style: kBaseTextStyle,
        ),
      ],
    );
  }
}
