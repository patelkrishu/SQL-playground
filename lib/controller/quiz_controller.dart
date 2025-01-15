import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/quiz_model.dart';

class QuizController extends GetxController {
  var option = ''.obs;
  var maxSecond = 60.obs;

  var currentQuestionIndex = 0.obs;

  Timer? timer;

  var selectedOptions = List<String?>.filled(30, null).obs;

  String? get correctAns => questions[currentQuestionIndex.value].answer;

  //
  // void onInit() {
  //   super.onInit();
  //   fetchQuestions('Medium');
  // }

  void selectOption(String value) {
    option.value = value;
  }

  void startTimer(int seconds) {
    maxSecond.value = seconds;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (maxSecond.value > 0) {
        maxSecond.value--;
      } else {
        timer.cancel();
        print('time is up');
        if (currentQuestionIndex.value < questions.length - 1) {
          currentQuestionIndex.value++;
          startTimer(questions[currentQuestionIndex.value].timer);
        }
      }
    });
  }

  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  // Timer timer =  Timer.periodic(Duration(seconds: 1), (timer) {
  //   print('++++');
  //   maxSecond--;
  //   if (maxSecond == 0) {
  //     timer.cancel();
  //   }
  // },);

  Color getOptionColor(String value) {
    if (value == option.value) {
      return value == '$correctAns' ? Colors.green : Colors.red;
    }
    return Colors.black26;
  }

  void onOptionSelect(String? value) {
    if (selectedOptions[currentQuestionIndex.value] == null) {
      selectedOptions[currentQuestionIndex.value] = value;
      option.value = value!;
      bool isCorrect = value == correctAns;
      updateStatus(isCorrect);
    }
  }

  Future<List<dynamic>> fetchdata() async {
    final ref = FirebaseDatabase.instance.ref();
    final databaseEvent = await ref.child('Questions').once();
    print('data:::::::::: ${databaseEvent.snapshot.value}');

    final data = databaseEvent.snapshot.value as List<dynamic>;
    return data;
  }

  var questions = <Quizqestion>[].obs;

  // var currentQuestionIndex = 0.obs;
  var options = ''.obs;

  void fetchQuestions(String difficulty) async {
    var data = await fetchdata();
    questions.value =
        data.where((element) {
          print(element);
          print('@@@@@ ${element['difficulty']}');
          return element['difficulty'] == difficulty;
        }).map((item) => Quizqestion.fromMap(item.cast<String, dynamic>()))
            .toList();

    if (questions.isNotEmpty) {
      startTimer(questions[currentQuestionIndex.value].timer);
    }
  }

  void onOptionSelected(String? value) async {
    options.value = value ?? '';
  }

  RxList<bool?> status = List<bool?>
      .filled(30, null)
      .obs;

  void updateStatus(bool isCorrect) {
    status[currentQuestionIndex.value] = isCorrect;
  }

// void questionColor(int index) {
//
//
//   if(selectedOptions[index] != null){
//     if(selectedOptions[index] == questions[index].answer){
//       return Colors.green;
//     }else{
//       return Colors.red;
//     }
//   }else{
//     return Colors.black26;
//   }
// }
}


// final TheoryService _theoryService = TheoryService();
//
// Future<void> fetchdata() async {
//
//   final ref = FirebaseDatabase.instance.ref();
//   final databaseEvent = await ref.child('Questions').once();
//     print(databaseEvent.snapshot.value);
//
// }