import 'package:coteccons_app/shared/widgets/base_screen/add_task_button.dart';
import 'package:coteccons_app/shared/widgets/base_screen/user_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: AppBarTitle(
                title: title,
              )),
              AppBarAction(
                title: title,
              )
            ],
          ),
        ));
  }
}

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddTaskButton(),
          SizedBox(
            width: 10,
          ),
          UserPopupMenu(),
        ],
      );
    }
    return SizedBox();
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
              padding: EdgeInsets.zero),
          Text(
            title!,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      );
    }
    return Container(
      alignment: Alignment.centerLeft,
      child: Image.asset("assets/images/app_icon.jpeg", height: 50),
    );
  }
}
