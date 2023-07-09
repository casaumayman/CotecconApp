import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class PriceInput extends StatelessWidget {
  const PriceInput(
      {super.key, required this.label, this.value, this.controller});

  final String label;
  final String? value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
              color: hexToColor("#171A1F"), fontWeight: FontWeight.bold),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: hexToColor("#9095A0"))),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: InputBorder.none,
              isDense: true,
            ),
            inputFormatters: [],
            keyboardType: TextInputType.number,
            // textAlignVertical: TextAlignVertical.center,
          ),
        )
      ],
    );
  }
}
