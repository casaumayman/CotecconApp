import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Image.asset("assets/images/app_icon.jpeg"),
    );
  }
}
