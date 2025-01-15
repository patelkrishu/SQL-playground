import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../views/widget/buttons/orange_button.dart';

class FetchAllQuery extends GetxController {
  final dio = Dio();

  Future<List<Map<String, dynamic>>?> getHttp(
      String query, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/sql_playground/api_handler.php'),
        body: {'query': query},
      );

      print('Response Query = $query');
      print('Response = ${response.body}');

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        if (data.containsKey('error')) {
          throw Exception(data['error']);
        }

        var tableData = data['data'].cast<Map<String, dynamic>>();
        return tableData;
      } else {
        throw Exception('Failed to execute query');
      }
    } catch (error) {
      print('Error: $error');

      Get.defaultDialog(
        title: error.toString(),
        titleStyle: Theme.of(context).textTheme.titleMedium,
        backgroundColor: Theme.of(context).canvasColor,
        radius: 8,
        contentPadding: const EdgeInsets.all(50),
        content: OrangeButton(
          text: 'Okay',
          onTap: () {
            Get.back();
          },
        ),
      );

      // showErrorDialog(
      //   error.toString(),
      // );
      return null;
    }
  }

  void showErrorDialog(String errorMessage) {
    Get.defaultDialog(
      title: 'Error',
      middleText: errorMessage,
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }
}

// >>>>>>>>>>>>>>>>>>> when error dialog is open so error around orange colour so what should i do
