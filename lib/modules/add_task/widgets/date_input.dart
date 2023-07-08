import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/constants/colors.dart';
import 'package:coteccons_app/shared/utils/utils.dart';

class DateInput extends StatelessWidget {
  DateInput(
      {super.key,
      required this.label,
      this.onChange,
      this.value,
      this.isRequired = false});

  final String label;
  final TextEditingController controller = new TextEditingController();
  final Function(DateTime)? onChange;
  final bool isRequired;
  final DateTime? value;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      controller.text = MyDateUtils.format(value!, format: "yyyy-MM-dd");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: hexToColor("#171A1F"), fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: hexToColor("#9095A0"))),
          child: TextFormField(
            controller: controller,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              final today = DateTime.now();
              showDatePicker(
                      context: context,
                      initialDate: value ?? today,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2100))
                  .then((value) {
                if (value != null) {
                  onChange?.call(value);
                  controller.text = MyDateUtils.format(value);
                }
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: InputBorder.none,
              isDense: true,
            ),
            inputFormatters: [],
            keyboardType: TextInputType.number,
            // textAlignVertical: TextAlignVertical.center,
          ),
        )
      ],
    );
  }
}
