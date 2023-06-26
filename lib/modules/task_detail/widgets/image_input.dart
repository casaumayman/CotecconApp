import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = hexToColor("#01BEB7");
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: color, width: 1)),
      alignment: Alignment.center,
      child: Icon(
        Icons.add_a_photo,
        color: color,
        size: 30,
      ),
    );
  }
}
