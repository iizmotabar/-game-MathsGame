import 'package:flutter/material.dart';

class FlatContainer extends StatelessWidget {
  const FlatContainer({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2)),
      height: 50,
      width: 50,
      child: const Center(child: Text('')),
    );
  }
}
