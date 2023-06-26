import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/comment.dart';
import 'package:flutter_getx_boilerplate/shared/utils/utils.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              comment.userName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              MyDateUtils.format(comment.createdDate),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
        Text(
          comment.message,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
