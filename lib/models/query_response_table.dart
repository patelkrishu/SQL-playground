class QueryResponseTable {
  List<String> columns;
  List<Map<String, dynamic>> tableResponse;

  QueryResponseTable({required this.columns, required this.tableResponse});

  factory QueryResponseTable.fromList(List<Map<String, dynamic>> data) {
    print('!!!!!!!!!!!!!!!! $data');
    List<String> columns = data[0].keys.toList();
    return QueryResponseTable(columns: columns, tableResponse: data);
  }
}
