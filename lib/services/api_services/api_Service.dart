import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../models/table_model.dart';

class ApiService extends GetxController {
  final dio = Dio();
  List<TableModel> tables = [];

  @override
  void onInit() {
    super.onInit();
    fetchAllTableData().then((value) {
      tables = value;

      print('+++++ )))) ${tables.length}') ;
    });
  }

  Future<List<TableModel>> fetchAllTableData() async {
    try {
      // var url = Uri.parse('http://localhost/SqlPlayground/tabel_query.php');
      var url = Uri.parse('http://localhost/sql_playground/get.php');
      var response = await get(url);
      print("+++ ${response.body}");
      Map responseData = jsonDecode(response.body);
      List data = responseData['data'] ?? [];
      return data
          .map(
            (json) => TableModel.fromJson(json),
          )
          .toList();
    } on Exception catch (e) {
      print('++!!!!!!!!!!!!!!!!!!!!!!!!!!! $e');
      return [];
    }
  }
}
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../models/table_model.dart';
//
// class ApiService extends GetxController {
//   List<TableModel> tables = [];
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchAllTableData().then((tableNames) {
//       tables = tableNames.map((name) => TableModel(name: name, columns: [])).toList();
//       print('+++++ Total Tables: ${tables.length}');
//     }).catchError((e){
//       print("error:${e}");
//     });
//   }
//
//   Future<List<String>> fetchAllTableData() async {
//     try {
//       var url = Uri.parse('http://localhost/sql_playground/get.php');
//       var response = await http.get(url); // Use http.get for the request
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         List<dynamic> data = responseData['data'] ?? [];
//
//         print('Fetchd tables:${data}');
//         // Ensure we return a List<String> for table names
//         return List<String>.from(data);
//       } else {
//         print('Error: Failed to fetch data. Status code: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       print('Error fetching table data: $e');
//       return [];
//     }
//   }
// }