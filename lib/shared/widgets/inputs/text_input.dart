import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      this.label,
      this.value,
      this.controller,
      this.enabled,
      this.placeholder});

  final String? label;
  final String? value;
  final TextEditingController? controller;
  final bool? enabled;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      controller?.text = value!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Text(
                label!,
                style: TextStyle(
                    color: hexToColor("#171A1F"), fontWeight: FontWeight.bold),
              )
            : SizedBox(),
        Container(
          height: 40,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: hexToColor("#9095A0"))),
          child: TextField(
            controller: controller,
            autofocus: false,
            enabled: enabled,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey),
                hintText: this.placeholder),
            // textAlignVertical: TextAlignVertical.center,
          ),
        )
      ],
    );
  }
}
