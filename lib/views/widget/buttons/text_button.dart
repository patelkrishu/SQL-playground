import 'package:flutter/material.dart';
import 'package:new_sql_playground/utilitys/extensions/decorative_extension.dart';
import '../text/tile_text.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    this.text,
    required this.iconImgPath,
    required this.onTap,
  });

  final String? text;
  final String iconImgPath;
  final void Function() onTap;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              widget.iconImgPath,
              color: isHover ? Colors.orange: Theme.of(context).hintColor,
              height: 25,
              width: 25,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.ac_unit_rounded);
              },
            ),
            if (widget.text != null) ...[
              10.hSpace,
              TitleText(
                widget.text!,
                color: isHover ? Colors.orange : null,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
