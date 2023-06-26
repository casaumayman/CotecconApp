import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/image_input.dart';

class ImagesInput extends StatelessWidget {
  const ImagesInput(
      {super.key,
      required this.images,
      this.disabled = false,
      required this.label});

  final List<String> images;
  final bool disabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    List<String?> renderImages = List.of(images);
    if (!disabled) {
      renderImages.add(null);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          children: renderImages.map((url) {
            if (url != null) {
              return Image.network(
                url,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              );
            }
            return ImageInput();
          }).toList(),
        ),
      ],
    );
  }
}
