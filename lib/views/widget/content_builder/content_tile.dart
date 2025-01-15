import 'package:flutter/material.dart';
import '../text/tile_text.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TitleText(title);
  }
}
