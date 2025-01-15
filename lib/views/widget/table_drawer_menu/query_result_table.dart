import 'package:flutter/material.dart';

class QueryResultTable extends StatelessWidget {
  final List<dynamic> data;

  const QueryResultTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(child: Text('not'));
    }

    final columns = data[0].keys.toList();

    return SingleChildScrollView(
      child: DataTable(
        columns: columns
            .map((column) => DataColumn(label: Text(column.toString())))
            .toList(),
        rows: data
            .map((row) => DataRow(
          cells: columns
              .map((column) => DataCell(Text(row[column].toString())))
              .toList(),
        ))
            .toList(),
      ),
    );
  }
}
