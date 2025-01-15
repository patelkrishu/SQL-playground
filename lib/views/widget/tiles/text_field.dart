import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

import '../../../storages/sql_model.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({
    super.key,
    required this.width,
    required this.onPanUpdate,
    required this.codeController,
  });

  final double width;
  final void Function(DragUpdateDetails)? onPanUpdate;
  final CodeController codeController;

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final double maxWidth = 400;

  final CodeController codeController = CodeController(language: sql);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height - 120,
      width: widget.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: GestureDetector(
                  child: Container(
                alignment: Alignment.centerLeft,
                height: double.infinity,
                width: 3,
                color: Theme.of(context).cardTheme.color,
              ))),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: CodeTheme(
                data: CodeThemeData(styles: sqlTheme),
                child: CodeField(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  background: Colors.transparent,
                  minLines: 1,
                  maxLines: 20,
                  /// run par click karvathi je response console screen ma show thay ae chhe...
                  controller: widget.codeController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// this screen is text field
