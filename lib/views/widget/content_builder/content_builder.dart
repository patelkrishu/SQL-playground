import 'package:flutter/material.dart';
import '../../../models/theory_model.dart';
import '../text/tile_text.dart';
import 'content_tile.dart';

class ContentBuilder extends StatelessWidget {
  const ContentBuilder({super.key, required this.contents});

  final Contents contents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(contents.title),
        ListView.builder(
          shrinkWrap: true,
          itemCount: contents.descriptions.length,
          itemBuilder: (context, index) => ContentTile(
            title: contents.descriptions[index],
          ),
        ),
      ],
    );
  }
}
