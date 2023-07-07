import 'package:coteccons_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/modules/task_detail/widgets/image_input.dart';
import 'package:coteccons_app/models/models.dart' as Model;
import 'package:get/get.dart';

class ImagesInput extends StatelessWidget {
  const ImagesInput(
      {super.key,
      required this.images,
      this.disabled = false,
      required this.label,
      this.onTap});

  final List<Model.ImageInfo> images;
  final bool disabled;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<Model.ImageInfo?> renderImages = List.of(images);
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
          children: renderImages.map((imageInfo) {
            if (imageInfo != null) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.IMAGE_VIEW, arguments: imageInfo.fullFile);
                },
                child: Image.network(
                  imageInfo.thumbnail!,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              );
            }
            return ImageInput(
              onTap: onTap,
            );
          }).toList(),
        ),
      ],
    );
  }
}
