import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/views/widget/table_drawer_menu/side_drawer_menu.dart';
import '../../../services/api_services/api_Service.dart';

class TableInfo extends StatelessWidget {
  const TableInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApiService apiService = Get.find<ApiService>();

    print('**** **** ${apiService.tables.length}');

    return Container(
      height: size.height - 120,
      width: 300,
      color: Theme.of(context).canvasColor,

      /// ahiya thi data nu table chhe ae vertical ma scroll thashe...
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            apiService.tables.length,
            (index) => TableInfoLakdiSideDrawer(
              table: apiService.tables[index],
              drawerWidth: size.width,
            ),
          ),
        ),
      ),
    );
  }
}

// this screen is table drawer menu
