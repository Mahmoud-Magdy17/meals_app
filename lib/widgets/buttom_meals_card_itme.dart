import 'package:flutter/material.dart';

class ButtomMealsCardItem extends StatelessWidget {
  const ButtomMealsCardItem(
      {super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
