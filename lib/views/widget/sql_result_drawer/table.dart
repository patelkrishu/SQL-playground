import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/sql_controller.dart';
import '../text/tile_text.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          color: Theme.of(context).canvasColor,
          child: Table(
            border: TableBorder.all(
              color: Theme.of(context).textTheme.titleMedium!.color!,
            ),
            columnWidths: const {
              0: FixedColumnWidth(64),
              1: FixedColumnWidth(64),
              2: FixedColumnWidth(64),
              3: FixedColumnWidth(64),
              4: FixedColumnWidth(64),
              5: FixedColumnWidth(64),
              6: FixedColumnWidth(64),
              7: FixedColumnWidth(64),
              8: FixedColumnWidth(64),
              9: FixedColumnWidth(64),
              10: FixedColumnWidth(64),
              11: FixedColumnWidth(64),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children:
                (Get.find<SqlController>().table.value?.columns ??
                    [])
                    .map(
                      (cellData) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Center(child: TitleText(cellData)),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(
                  color: const Color(0xffbbbdc2),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(64),
                  1: FixedColumnWidth(64),
                  2: FixedColumnWidth(64),
                  3: FixedColumnWidth(64),
                  4: FixedColumnWidth(64),
                  5: FixedColumnWidth(64),
                  6: FixedColumnWidth(64),
                  7: FixedColumnWidth(64),
                  8: FixedColumnWidth(64),
                  9: FixedColumnWidth(64),
                  10: FixedColumnWidth(64),
                  11: FixedColumnWidth(64),
                },
                defaultVerticalAlignment:
                TableCellVerticalAlignment.middle,

                // ----------------------------------------------------------

                children: Get.find<SqlController>()
                    .table
                    .value!
                    .tableResponse
                    .map(
                      (row) {
                    return TableRow(
                      children: row.values.map(
                            (cellData) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: TitleText(cellData),
                                )),
                          );
                        },
                      ).toList(),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
