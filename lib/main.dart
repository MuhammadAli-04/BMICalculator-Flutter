import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'child_gender.dart';
import 'constants.dart';
import 'ResultPage.dart';
import 'dart:math';
import 'reusable_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white38,
      ),
      debugShowCheckedModeBanner: false,
      home: const CalculationPage(),
    );
  }
}

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {

  int height = 180;
  Gender? gender;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("BMI Calculator")
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                    function: (){
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male ? kActiveCardColor : kInActiveCardColor,
                  child: const ChildGender(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  )
                ),
                ReusableCard(
                  function: (){
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  colour: gender == Gender.female ? kActiveCardColor : kInActiveCardColor,
                  child: const ChildGender(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                    colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style : kBaseTextStyle,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$height",
                          style : kNumberTextStyle,
                        ),
                        const Text("cm"),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SliderTheme(
                        data : const SliderThemeData(
                          overlayColor: Color(0x60e91e63),
                        ),
                        child : Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 240.0,
                          activeColor: Colors.white30,
                          inactiveColor: Colors.white10,
                          thumbColor: Colors.pink,
                          onChanged: (val){
                            setState(() {
                              height = val.round();
                            });
                          },
                        )
                    ),
                  ]
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                    colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "WEIGHT",
                        style : kBaseTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "$weight",
                            style : kNumberTextStyle
                          ),
                          const Text(" kg"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                            backgroundColor: Colors.blueGrey,
                            child: const Icon(FontAwesomeIcons.minus),
                          ),
                          FloatingActionButton(
                            onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                            backgroundColor: Colors.blueGrey,
                            child: const Icon(FontAwesomeIcons.plus),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
                ReusableCard(
                  colour: kActiveCardColor,
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "AGE",
                        style : kBaseTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "$age",
                              style : kNumberTextStyle
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            backgroundColor: Colors.blueGrey,
                            child: const Icon(FontAwesomeIcons.minus),
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: Colors.blueGrey,
                            child: const Icon(FontAwesomeIcons.plus),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
          ReusableButton(label: 'calculate', onTap: (){
            double bmi = weight / pow((height / 100) , 2);
            String remarks;
            if(bmi >=25){
              remarks = 'Overweight';
            } else if (bmi > 18.5 ){
              remarks = 'Normal';
            }
            else{
              remarks = 'Underweight';
            }
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => ResultPage(
                remarks : remarks,
                weight : bmi.toStringAsFixed(1),
              ),
            ),
            );
          },)
        ],
      )
    );
  }
}


// class RoundIconButton extends StatelessWidget {
//   const RoundIconButton({super.key, required this.onPressed, required this.icon});
//   final void Function() onPressed;
//   final IconData icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       padding: const EdgeInsets.all(0.0),
//         onPressed:onPressed,
//       child: ,
//     );
//   }
// }
