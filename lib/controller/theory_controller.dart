import 'package:get/get.dart';

import '../models/theory_model.dart';
import '../services/api_services/fetch_theory.dart';


class TheoryController extends GetxController {
  static TheoryController get instance => Get.find<TheoryController>();

  Rx<TheoryModel?> currentTheory = Rx<TheoryModel?>(null);
  final TheoryService _theoryService = TheoryService();

  Future<List<TheoryModel>> fetchTheory() async {
    List object = await _theoryService.fetchAllTheory();
    print('************* 444 ');
    return object.map((e) => TheoryModel.fromJson(e as Map)).toList();
  }
}