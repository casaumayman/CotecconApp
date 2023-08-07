import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/models/comment.dart';
import 'package:coteccons_app/modules/main-app/task_detail/widgets/comment_input.dart';

class Comments extends StatelessWidget {
  const Comments({super.key, required this.commemts});

  final List<Comment> commemts;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 5,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "Bình Luận",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...commemts
            .map((c) => CommentWidget(
                  comment: c,
                ))
            .toList(),
        CommentInput()
      ],
    );
  }
}
