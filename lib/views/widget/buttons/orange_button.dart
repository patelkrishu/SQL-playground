import 'package:flutter/material.dart';
import '../text/tile_text.dart';

class OrangeButton extends StatefulWidget {
  const OrangeButton({super.key, this.text, required this.onTap, this.width=110});

  final String? text;
  final void Function() onTap;
  final double width;

  @override
  State<OrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<OrangeButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 35,
          width: widget.width,
          // width: 110,
          decoration: BoxDecoration(
            color: isHover?Colors.orange:Theme.of(context).cardColor,
            border: Border.all(
              color: Colors.orange,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child:Center(
            child: TitleText(
              widget.text!,
              color: isHover ? Colors.black : null,
            ),
          ),
        ),
      ),
    );
  }
}
