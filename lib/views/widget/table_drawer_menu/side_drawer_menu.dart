import 'package:flutter/material.dart';
import '../../../models/table_model.dart';
import '../text/tile_text.dart';

class TableInfoLakdiSideDrawer extends StatefulWidget {
  final TableModel table;
  final double drawerWidth;

  const TableInfoLakdiSideDrawer(
      {super.key, required this.table, required this.drawerWidth});

  @override
  State<TableInfoLakdiSideDrawer> createState() =>
      _TableInfoLakdiSideDrawerState();
}

class _TableInfoLakdiSideDrawerState extends State<TableInfoLakdiSideDrawer> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: SizedBox(
            width: 200,
            child: ListTile(
              title: TitleText(widget.table.name),
              trailing: const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isOpen,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: 280,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: List.generate(
                      widget.table.columns.length,
                      (rowIndex) {
                        return TableRow(
                          children: List.generate(
                            1,
                            (columIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TitleText(widget.table.columns[rowIndex].name),
                                // child: TitleText(
                                //   columIndex % 2 == 0
                                //       ? widget.table.columns[rowIndex].name
                                //       : widget.table.columns[rowIndex].type,
                                // ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

