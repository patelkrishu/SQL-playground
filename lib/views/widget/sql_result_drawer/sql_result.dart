import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/sql_controller.dart';
import '../text/tile_text.dart';
import 'table.dart';

class SQLResult extends StatelessWidget {
  const SQLResult({
    super.key,
    required this.height,
    required data,
  });

  final RxDouble height;
  final double maxHeight = 400;

  @override
  Widget build(BuildContext context) {
    // var height = 100.0.obs;
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        height: height.value,
        width: size.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                onPanUpdate: (details) {
                  double newHeight = height.value - details.delta.dy;
                  if ((height.value - details.delta.dy) >= 46 &&
                      newHeight <= maxHeight) {
                    height.value -= details.delta.dy;
                  }
                },
                child: Container(
                  // alignment: Alignment.topCenter,
                  height: 10,
                  width: double.infinity,
                  // color: Color(0xff535456),
                  color: Theme.of(context).cardTheme.color,
                  child: Icon(
                    Icons.drag_handle,
                    size: 20,
                    color: Colors.white,
                  ),
                  // width: 10,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (Get.find<SqlController>().table.value?.columns ?? [])
                        .isNotEmpty
                    ? TableWidget()
                    : Center(child: TitleText('Table result will be appear here...',fontSize: 30,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
