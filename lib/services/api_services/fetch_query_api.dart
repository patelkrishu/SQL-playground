import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class FetchQueryApi extends GetxController {

  Future<void> fetchall() async {

    var url = Uri.parse('http://localhost/sql_playground/api_handler.php');
    var response = await http.post(url,body: {"query":'SELECT * FROM users'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('http://localhost/sql_playground/api_handler.php')));

  }

}