import 'package:flutter/material.dart';
import 'reusable_button.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.remarks, required this.weight});

  final String remarks;
  final String weight;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child : Text(
            "BMI Calculator"
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top : 16.0),
            child:  Text(
                "Your Result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          ReusableCard(
            colour: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  remarks,
                  style: kBaseTextStyle,
                ),
                Text(
                  weight,
                  style: kResultNumberTextStyle,
                ),
                Text(
                  advice[remarks]!,
                  textAlign: TextAlign.center,
                  style: kBaseTextStyle,
                ),
              ],
            ),
          ),
          ReusableButton(
              label: 're-calculate',
              onTap: (){
            Navigator.pop(context);
          }),
        ],
      )
    );
  }
}
