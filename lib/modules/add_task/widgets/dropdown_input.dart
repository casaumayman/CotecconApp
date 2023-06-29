import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class DropdownItem {
  final String label;
  final String value;
  DropdownItem(this.label, this.value);
}

class DropDownInput extends StatelessWidget {
  const DropDownInput(
      {super.key,
      required this.items,
      this.value,
      this.onChange,
      required this.label});

  final List<DropdownItem> items;
  final String label;
  final String? value;
  final void Function(String id)? onChange;

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
          height: 40,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: hexToColor("#9095A0"))),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: InputBorder.none,
              isDense: true,
            ),
            value: value,
            items: items
                .map((e) => DropdownMenuItem<String>(
                      child: Text(e.label),
                      value: e.value,
                    ))
                .toList(),
            isExpanded: true,
            onChanged: (value) {
              if (onChange != null && value != null) {
                onChange!(value);
              }
            },
            // itemHeight: 20,
          ),
        )
      ],
    );
  }
}
