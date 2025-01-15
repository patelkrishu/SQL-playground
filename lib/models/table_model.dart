class TableModel {
  String name;
  List<ColumnData> columns;

  TableModel({
    required this.name,
    required this.columns,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    String name = json['table'];
    List<dynamic> list = json['columns'];

    // Mapping columns to ColumnData objects with default type 'unknown'
    List<ColumnData> column = list.map((e) {
      if (e is String) {
        // If the column is a string, infer type as 'unknown'
        return ColumnData(name: e, type: 'unknown');
      } else {
        throw Exception('Invalid column data format');
      }
    }).toList();

    return TableModel(
      name: name,
      columns: column,
    );
  }
}

class ColumnData {
  String name;
  String type;

  ColumnData({
    required this.name,
    required this.type,
  });

  factory ColumnData.fromJson(Map<String, dynamic> json) {
    return ColumnData(
      name: json['name'] as String,
      type: json['type'] as String? ?? 'unknown',
    );
  }
}