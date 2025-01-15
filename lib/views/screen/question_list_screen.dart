import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionListScreen extends StatelessWidget {
  final List<String> questions;

  const QuestionListScreen({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Question List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange)),
              child: ListTile(
                title: Text(
                  questions[index],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                /// question show in black colour...
                onTap: () {
                  Get.back(result: questions[index]);
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 3,
          );
        },
        itemCount: questions.length,
      ),
    );
  }
}

//// >>>>>> this screen is question list screen
