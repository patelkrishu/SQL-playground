import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/utilitys/extensions/decorative_extension.dart';
import '../../controller/home_controller.dart';
import '../../controller/quiz_controller.dart';
import '../widget/buttons/orange_button.dart';
import '../widget/text/tile_text.dart';
import '../widget/tiles/question_radio_tile.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // bool isHover = false;
  final QuizController controller = Get.find<QuizController>();

  // final List<String> options = [
  //   'Structured Query Language',
  //   'Simple Query Language',
  //   'Structured Question Language',
  //   'Simplified Query Language'
  // ];

  // void initState() {
  //   super.initState();
  //   controller.fetchQuestions('Medium');
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // if (controller.questions.isNotEmpty) {
    //   return const CircularProgressIndicator();
    // }
    // final currentQuestion = controller.questions[controller.currentQuestionIndex.value];

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 80,
                  width: 1200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black26,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 12, right: 950, top: 12, bottom: 12),
                    child: GetX<QuizController>(
                      builder: (controller) {
                        if (controller.questions.isNotEmpty) {
                          final currentQuestion = controller
                              .questions[controller.currentQuestionIndex.value];
                          return TitleText(
                            'Question ${controller.currentQuestionIndex.value + 1}:\n${currentQuestion.question}',

                            // 'Question 1:\nWhat does SQL stand for?',
                          );
                        }
                        return const TitleText('Loading...');
                      },
                    ),
                  ),
                ),
              ),
              5.vSpace,
              Obx(
                () => Align(
                  alignment: Alignment.centerRight,
                  child: TitleText(
                    'Timer: ${controller.maxSecond.value}s',
                    // style: darkText.titleMedium,
                  ),
                ),
              ),
              30.vSpace,
              GetX<QuizController>(
                builder: (controller) {
                  if (controller.questions.isNotEmpty) {
                    final currentQuestion = controller
                        .questions[controller.currentQuestionIndex.value];
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: currentQuestion.options.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Obx(
                        () => QuestionRadioTile(
                          text: currentQuestion.options[index],
                          value: currentQuestion.options[index],
                          groupValue: controller.option.value,
                          onChanged: controller.onOptionSelect,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                    );
                  }
                  return const TitleText('Loading...');
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Row(
                  children: [
                    Visibility(
                      visible: false,
                      child: OrangeButton(
                        width: 150,
                        text: 'Previous',
                        onTap: () {
                          if (controller.currentQuestionIndex.value > 0) {
                            controller.currentQuestionIndex.value--;
                            controller.options.value = '';
                          }
                        },
                      ),
                    ),
                    Spacer(),
                    OrangeButton(
                      width: 150,
                      text: 'Next',
                      onTap: () {
                        if (controller.currentQuestionIndex.value <
                            controller.questions.length - 1) {
                          // controller.currentQuestionIndex.value++;
                          controller.options.value = '';
                          // controller.maxSecond.value=0;
                          controller.startTimer(controller
                              .questions[controller.currentQuestionIndex.value]
                              .timer);
                          if (controller.questions.length ==
                              controller.currentQuestionIndex + 1) {
                            Get.defaultDialog(
                                title: 'Go to Next Level',
                                titleStyle:
                                    Theme.of(context).textTheme.titleMedium,
                                // titleStyle: TextStyle(color: Colors.white,fontSize: 20),
                                //   backgroundColor: Color(0xff2b2d30),
                                backgroundColor: Theme.of(context).canvasColor,
                                radius: 10,
                                contentPadding: EdgeInsets.all(50),
                                content: Container(
                                    // height: 200,
                                    // width: 300,
                                    child: Row(children: [
                                  OrangeButton(
                                    width: 150,
                                    text: 'Next level',
                                    onTap: () {
                                      controller.fetchQuestions('Medium');
                                      controller.currentQuestionIndex.value = 0;
                                      controller.questions.clear();
                                      controller.selectedOptions.value =
                                          List<String?>.filled(30, null);
                                      controller.status.value =
                                          List<bool?>.filled(30, null);
                                      Get.find<HomeController>()
                                          .currentIndex
                                          .value = 3;
                                      Get.back();
                                    },
                                  ),
                                ])));
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              50.vSpace,
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                // color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: GetX<QuizController>(
                              builder: (controller) {
                                if (controller.questions.isNotEmpty) {
                                  return TitleText(
                                    'Question ${controller.currentQuestionIndex.value + 1}/30',
                                    // 'Question 1/30',
                                  );
                                }
                                return TitleText("Loading...");
                              },
                              // child: TitleText(
                              //     'Question ${controller.currentQuestionIndex.value +1}/30',
                              //     // 'Question 1/30',
                              //     ),
                            )),
                        Expanded(
                            child: Visibility(
                          visible: false,
                          child: OrangeButton(
                            text: 'Need Help?',
                            onTap: () {},
                          ),
                        )),
                      ],
                    ),
                    30.vSpace,
                    Expanded(
                      child: GetX<QuizController>(builder: (controller) {
                        debugPrint('${controller.status[0]}');
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 5),
                          itemCount: controller.questions.length,
                          itemBuilder: (context, index) {
                            bool? status = controller.status[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: status == null
                                    ? Colors.black26
                                    : status
                                        ? Colors.green
                                        : Colors.red,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.orange),
                              ),
                              child: Center(
                                  child: TitleText(
                                '${index + 1}',
                              )),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
