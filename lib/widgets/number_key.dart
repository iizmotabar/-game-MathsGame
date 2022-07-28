import 'package:flutter/material.dart';

import '../constants.dart';

class NumberKey extends StatelessWidget {
  var buttonColor = Colors.deepPurple[400];
  final String numberValue;
  final VoidCallback onTap;
  NumberKey({Key? key, required this.numberValue, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (numberValue == 'C') {
      buttonColor = Colors.green;
    } else if (numberValue == 'DEL') {
      buttonColor = Colors.red;
    } else if (numberValue == '=') {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: buttonColor,
          ),
          child: Center(
            child: Text(
              numberValue.toString(),
              style: kWhiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
