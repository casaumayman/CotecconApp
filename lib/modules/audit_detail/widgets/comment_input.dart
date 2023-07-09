import 'package:coteccons_app/modules/private_task_detail/task_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/constants/colors.dart';
import 'package:get/get.dart';

class CommentInput extends GetView<PrivateTaskDetailController> {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          border: Border.all(color: hexToColor("#9095A0"), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller.commentInputController,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                final message = controller.commentInputController.text;
                if (message.isEmpty) {
                  return;
                }
                controller.sendComment(message);
              },
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: hexToColor("#00BDD6"),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            border: InputBorder.none,
            isDense: true,
            hintText: "Viết bình luận...",
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
