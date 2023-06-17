import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  Widget? child;
  void Function()? function;

  ReusableCard({super.key, required this.colour,this.child,this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap : function,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: child,
        ),
      ),
    );
  }
}
