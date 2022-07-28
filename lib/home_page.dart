import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'widgets/alert_dialogue.dart';
import 'widgets/flat_container.dart';
import 'widgets/neumorphic_container.dart';
import 'widgets/number_key.dart';

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
    '-',
    '0',
    ' ',
    ' ',
    '='
  ];

  //! Random Number assignment
  int numberOne = 5;
  int numberTwo = 7;

  //! User Answer
  String userAnswer = '';

  //! answerCounter for replacing boxes;
  int answerCounter = 0;

  //! Level Counter
  int levelCounter = 4;

  //! List of Boxes
  final List<Widget> answerBoxesList = [
    const NeumorphicContainer(),
    const NeumorphicContainer(),
    const NeumorphicContainer(),
    const NeumorphicContainer(),
    const NeumorphicContainer()
  ];

  //! User Tapped a Button
  void buttonTapped(String button) {
    //? Checking for equality
    if (button == '=') {
      if (userAnswer != '') {
        //? Check if user is correct or not
        checkResult();
      }
    }

    // //* Minus Button
    // if (button == '-') {
    //   userAnswer
    // }

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
        if (userAnswer.length < 4 && button != '=') {
          userAnswer += button;
        }
      });
    }
  }

  //! Reset Progress

  void resetProgress() {
    answerBoxesList.clear();
    for (int i = 0; i <= 4; i++) {
      answerBoxesList.add(const NeumorphicContainer());
    }
  }

  //!Check for results
  void checkResult() {
    if (levelCounter > 5) {
      showDialog(
          context: context,
          builder: (context) {
            return ShowAlertDialogue(
                onTap: goToNextAnswer,
                iconColor: Colors.deepPurple.shade300,
                headingText: 'You\'ve completed all levels! Congratulations!',
                icon: Icons.arrow_forward);
          });
      levelCounter = 0;
      resetProgress();
    }
    if (levelCounter < 2) {
      //* Catering for addition problems
      if (numberOne + numberTwo == int.parse(userAnswer)) {
        if (answerBoxesList[answerCounter] != const NeumorphicContainer()) {
          setState(() {
            answerBoxesList.removeAt(answerCounter);
            answerBoxesList.insert(answerCounter, const FlatContainer());
            answerCounter++;
            //* prints the answer counter value
            print(answerCounter);
          });
        }
        if (answerCounter == 5) {
          levelCounter++;
          answerCounter = 0;
          print('Level setter was called!');
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'LEVEL UP! Level $levelCounter now!',
                    icon: Icons.arrow_forward);
              });
          setState(() {
            resetProgress();
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'Correct!',
                    icon: Icons.arrow_forward);
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ShowAlertDialogue(
                icon: Icons.close,
                iconColor: Colors.red.shade300,
                headingText: 'Incorrect, Try Again :D',
                onTap: goBackToQuestion,
              );
            });
      }
    } else if (levelCounter >= 2 && levelCounter < 5) {
      if (numberOne - numberTwo == int.parse(userAnswer)) {
        if (answerBoxesList[answerCounter] != const NeumorphicContainer()) {
          setState(() {
            answerBoxesList.removeAt(answerCounter);
            answerBoxesList.insert(answerCounter, const FlatContainer());
            answerCounter++;
            //* prints the answer counter value
            print(answerCounter);
          });
        }
        if (answerCounter == 5) {
          levelCounter++;
          answerCounter = 0;
          print('Level setter was called!');
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'LEVEL UP! Level $levelCounter now!',
                    icon: Icons.arrow_forward);
              });
          setState(() {
            answerBoxesList.clear();
            for (int i = 0; i <= 4; i++) {
              answerBoxesList.add(const NeumorphicContainer());
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'Correct!',
                    icon: Icons.arrow_forward);
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ShowAlertDialogue(
                icon: Icons.close,
                iconColor: Colors.red.shade300,
                headingText: 'Incorrect, Try Again :D',
                onTap: goBackToQuestion,
              );
            });
      }
    } else if (levelCounter == 5) {
      if (numberOne - numberTwo == int.parse(userAnswer)) {
        if (answerBoxesList[answerCounter] != const NeumorphicContainer()) {
          setState(() {
            answerBoxesList.removeAt(answerCounter);
            answerBoxesList.insert(answerCounter, const FlatContainer());
            answerCounter++;
            //* prints the answer counter value
            print(answerCounter);
          });
        }
        if (answerCounter == 5) {
          levelCounter++;
          answerCounter = 0;
          print('Level setter was called!');
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'LEVEL UP! Level $levelCounter now!',
                    icon: Icons.arrow_forward);
              });
          setState(() {
            answerBoxesList.clear();
            for (int i = 0; i <= 4; i++) {
              answerBoxesList.add(const NeumorphicContainer());
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialogue(
                    onTap: goToNextAnswer,
                    iconColor: Colors.deepPurple.shade300,
                    headingText: 'Correct!',
                    icon: Icons.arrow_forward);
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ShowAlertDialogue(
                icon: Icons.close,
                iconColor: Colors.red.shade300,
                headingText: 'Incorrect, Try Again :D',
                onTap: goBackToQuestion,
              );
            });
      }
    }
  }

  //! Delete a buttonTap
  void clearAnswer() {
    setState(() {
      userAnswer = '';
    });
  }

  var randomNumber = Random();

  //! Go to next answer
  void goToNextAnswer() {
    //* Dismiss alert dialogue
    Navigator.pop(context);

    //* Reset Values
    setState(() {
      userAnswer = '';
    });
    //* Create a new question
    switch (levelCounter) {
      case 0:
        numberOne = randomNumber.nextInt(10);
        numberTwo = randomNumber.nextInt(10);
        break;
      case 1:
        numberOne = randomNumber.nextInt(100);
        numberTwo = randomNumber.nextInt(100);
        break;
      case 2:
        numberOne = randomNumber.nextInt(1000);
        numberTwo = randomNumber.nextInt(50);
        break;
      case 3:
        numberOne = randomNumber.nextInt(50);
        numberTwo = randomNumber.nextInt(1000);
        break;
      case 4:
        numberOne = randomNumber.nextInt(100);
        numberTwo = randomNumber.nextInt(100);
        break;
      case 5:
        numberOne = randomNumber.nextInt(1000);
        numberTwo = randomNumber.nextInt(1000);
    }
  }

  void goBackToQuestion() {
    //* Dismiss alert dialogue
    Navigator.pop(context);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: answerBoxesList,
            ),
          ),
          //! Question
          Expanded(
            child: Container(
              color: Colors.purple[300],
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (levelCounter <= 1)
                    Text(
                      '$numberOne + $numberTwo = ',
                      style: kWhiteTextStyle,
                    ),
                  if (levelCounter > 1 && levelCounter <= 3)
                    Text(
                      '$numberOne - $numberTwo = ',
                      style: kWhiteTextStyle,
                    ),
                  if (levelCounter == 4)
                    Text(
                      '$numberOne - $numberTwo = ',
                      style: kWhiteTextStyle,
                    ),
                  if (levelCounter == 5)
                    Text(
                      '$numberOne - $numberTwo = ',
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
