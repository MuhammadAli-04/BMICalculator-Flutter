import 'package:flutter/material.dart';

const kActiveCardColor = Colors.black45;
const kInActiveCardColor = Colors.black12;

const kBaseTextStyle = TextStyle(
  letterSpacing: 1.0,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

const kNumberTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kResultNumberTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 100.0,
);

enum Gender{
  male,
  female
}

Map<String , String> advice = {
  'Overweight' : 'You have a higher than normal body weight.Exercise more!',
  'Normal' : 'You have a normal body weight. Good Job!',
  'Underweight':'You have a lower than normal body weight.Eat more!'
};