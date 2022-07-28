import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
              color: Color.fromARGB(255, 32, 15, 88),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(3, 3)),
          BoxShadow(
              color: Colors.white.withOpacity(0.5),
              offset: const Offset(-1, -1),
              blurRadius: 15,
              spreadRadius: 1),
        ],
        // border: Border.all(
        //     color: Colors.white.withOpacity(0.4), width: 2),
      ),
      height: 50,
      width: 50,
      child: const Center(child: Text('')),
    );
  }
}
