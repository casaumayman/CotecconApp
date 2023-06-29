import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatelessWidget {
  ImageViewScreen({super.key});

  final String url = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Xem ảnh",
      child: Image.network(
        url,
        fit: BoxFit.contain,
      ),
    );
  }
}
