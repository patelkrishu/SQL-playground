import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/query_response_table.dart';
import '../services/api_services/fetch_all_query.dart';

class SqlController extends GetxController {
  final RxDouble drawerHeight = 257.0.obs;
  RxDouble left = 300.0.obs;
  RxDouble bottom = 250.0.obs;
  RxDouble top = 50.0.obs;
  var isOpen = false.obs;

  Rx<QueryResponseTable?> table = Rx<QueryResponseTable?>(null);

  Future<void> fetchResponse(String query, BuildContext context) async {
    final FetchAllQuery fetchAllQuery = FetchAllQuery();
    try {
      List<Map<String, dynamic>>? data = await fetchAllQuery.getHttp(query,context);

      //   if (data != null) {
      //     table.value = QueryResponseTable.fromList(data);
      //     print('############## ${table.value!.columns}');
      //   } else {
      //     // _showErrorDialog('No data returned for the query.');
      //   }
      // } catch (error) {
      //   _showErrorDialog(error.toString());
      // }

      if (data != null) {
        table.value = QueryResponseTable.fromList(data);
        print('############## ${table.value!.columns}');
      }
    } catch (error) {
      _showErrorDialog(error.toString());
    }
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: 'Error',
      content: Text(message),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('OK'),
      ),
    );
  }
}
