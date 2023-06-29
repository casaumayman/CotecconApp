import 'package:flutter/material.dart';
import 'package:coteccons_app/models/comment.dart';
import 'package:coteccons_app/shared/utils/utils.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 14;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Unknow sender",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
            Text(
              MyDateUtils.format(comment.time!, format: "HH:mm dd/MM/yyyy"),
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
        Text(
          comment.msg ?? '',
          style: TextStyle(fontSize: fontSize),
        )
      ],
    );
  }
}
