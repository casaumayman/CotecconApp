import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/constants/colors.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {super.key,
      required this.label,
      required this.icon,
      required this.placeHolder,
      required this.controller,
      this.isPassword = false});

  final String label;
  final Icon icon;
  final String placeHolder;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    return _CustomInputState();
  }
}

class _CustomInputState extends State<CustomInput> {
  bool _hidden = false;

  @override
  void initState() {
    _hidden = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final suffixIcon = widget.isPassword
        ? (_hidden ? Icons.visibility : Icons.visibility_off)
        : null;
    final hideText = widget.isPassword ? _hidden : false;

    final decoration = InputDecoration(
      prefixIcon: widget.icon,
      hintText: widget.placeHolder,
      border: InputBorder.none,
      filled: true,
      fillColor: hexToColor("#F3F4F6"),
      hintStyle: TextStyle(color: hexToColor("#BCC1CA")),
      prefixIconColor: Colors.black,
      suffixIconColor: Colors.black,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        enableFeedback: false,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          setState(() {
            _hidden = !_hidden;
          });
        },
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextFormField(
          decoration: decoration,
          obscureText: hideText,
          controller: widget.controller,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "${widget.label} không được trống!";
            }
            return null;
          },
        )
      ],
    );
  }
}
