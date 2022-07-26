import 'package:flutter/material.dart';
import 'package:math_game/constants.dart';

import 'widgets/number_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! NumberPad
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];

  //! Random Number assignment
  int numberOne = 1;
  int numberTwo = 2;

  //! User Answer
  String userAnswer = '';

  //! User Tapped a Button
  void buttonTapped(String button) {
    //? Checking for equality
    if (button == '=') {
      //? Check if user is correct or not
      checkResult();
    }

    //* Clear Button
    if (button == 'C') {
      clearAnswer();
    }
    //* Deleting a keypress
    else if (button == 'DEL') {
      setState(() {
        if (userAnswer != '') {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      });
    }
    //* Pressing the number Keys
    else {
      setState(() {
        if (userAnswer.length < 3) {
          userAnswer += button;
        }
      });
    }
  }

  //!Check for results
  bool checkResult() {
    if (numberOne + numberTwo == int.parse(userAnswer)) {
      return true;
    }
    return false;
  }

  //! Delete a buttonTap
  void clearAnswer() {
    setState(() {
      userAnswer = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //! Levels : A player needs five correct ones to level up
          Container(
            height: 160,
            color: Colors.deepPurple[500],
          ),
          //! Question
          Expanded(
            child: Container(
              color: Colors.purple[300],
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$numberOne + $numberTwo = ',
                    style: kWhiteTextStyle,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple,
                    ),
                    height: 50,
                    width: 100,
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: kWhiteTextStyle,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
          //! Numberpad for answer
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple[300],
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberPad.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return NumberKey(
                        onTap: () => buttonTapped(numberPad[index]),
                        numberValue: numberPad[index],
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
