import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label + ":",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(flex: 7, child: Text(value))
        ],
      );
  }
}
