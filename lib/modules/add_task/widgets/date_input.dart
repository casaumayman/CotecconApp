import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';

class DateInput extends StatelessWidget {
  const DateInput({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: hexToColor("#171A1F"), fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40,
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
