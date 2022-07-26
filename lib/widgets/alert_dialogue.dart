import 'package:flutter/material.dart';

import '../constants.dart';

class ShowAlertDialogue extends StatelessWidget {
  final VoidCallback onTap;
  final String headingText;
  final Color iconColor;
  final IconData icon;

  const ShowAlertDialogue(
      {Key? key,
      required this.onTap,
      required this.headingText,
      required this.iconColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              headingText,
              style: kWhiteTextStyle,
            ),
            //* Button to go to Next Question
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: iconColor, borderRadius: BorderRadius.circular(4.0)),
                child: InkWell(
                  onTap: () {
                    onTap();
                  },
                  child:  Icon(
                    icon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
