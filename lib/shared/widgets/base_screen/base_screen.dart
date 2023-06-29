import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:coteccons_app/shared/widgets/base_screen/base_app_bar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {super.key, this.title, this.child, this.resizeToAvoidBottomInset});

  final String? title;
  final Widget? child;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          Container(
            color: hexToColor("#081D4D"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              BaseAppBar(
                title: title,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: child,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
