import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      this.onAction,
      required this.actionIcon,
      required this.actionLabel});

  final String title;
  final void Function()? onAction;
  final String? actionLabel;
  final Icon? actionIcon;

  @override
  Widget build(BuildContext context) {
    final isHaveAction =
        actionLabel != null && actionIcon != null && onAction != null;
    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: _AppBarTitle(
                title: title,
              )),
              isHaveAction
                  ? _AppBarAction(
                      title: title,
                      onAction: onAction,
                      actionIcon: actionIcon!,
                      actionLabel: actionLabel!,
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction({
    this.title,
    this.onAction,
    required this.actionIcon,
    required this.actionLabel,
  });

  final String? title;
  final void Function()? onAction;
  final String actionLabel;
  final Icon actionIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAction,
      child: Row(
        children: [
          actionIcon,
          SizedBox(
            width: 10,
          ),
          Text(
            actionLabel,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.zero),
        Expanded(
            child: Text(
          title ?? "",
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ))
      ],
    );
  }
}
