import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/quiz_controller.dart';
import '../text/tile_text.dart';

class QuestionRadioTile extends StatefulWidget {
  const QuestionRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    required this.text,
  });

  final String value;
  final String groupValue;
  final void Function(String? value)? onChanged;
  final String text;

  @override
  State<QuestionRadioTile> createState() => _QuestionRadioTileState();
}

class _QuestionRadioTileState extends State<QuestionRadioTile> {
  bool isHover = false;

  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    bool isAnswered =
        controller.selectedOptions[controller.currentQuestionIndex.value] !=
            null;

    Color tileColor = controller.getOptionColor(widget.value);
    if (widget.value == controller.option.value) {
      tileColor = widget.value == '${controller.correctAns}'
          ? Colors.green
          : Colors.red;
    } else {
      tileColor = isHover
          ? Colors.orange[200]!.withOpacity(0.8)
          : Theme.of(context).cardColor;
    }
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: RadioListTile(
        tileColor: tileColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: TitleText(
          widget.text,
          color: isHover ? Colors.black : null,
          // 'Structured Query Language',

          // style: TextStyle(
          //     color: isHover ? Colors.black : Colors.white,
          //     fontSize: 20),
        ),
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: isAnswered ? null : widget.onChanged,
        activeColor: Colors.orange,
      ),
    );
  }
}
