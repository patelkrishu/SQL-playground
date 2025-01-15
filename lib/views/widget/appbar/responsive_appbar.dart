import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/utilitys/extensions/decorative_extension.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/quiz_controller.dart';
import '../../../utilitys/constants/sql_constants.dart';
import '../../../utilitys/themes/app_theme.dart';
import '../buttons/orange_button.dart';
import '../buttons/text_button.dart';
import '../logo/logo.dart';

class ResponsiveAppBar extends StatefulWidget {
  const ResponsiveAppBar({super.key});

  @override
  State<ResponsiveAppBar> createState() => _ResponsiveAppBarState();
}

class _ResponsiveAppBarState extends State<ResponsiveAppBar> {
  final QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    // app theme

    final _controller = ValueNotifier<bool>(mode == ThemeMode.light);
    bool quizClick = false;
    return Container(
      height: 56,
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxWidth);
          if (constraints.maxWidth <= 425) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  12.hSpace,
                  const TextLogo(),
                ],
              ),
            );
          } else if (constraints.maxWidth <= 768) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const TextLogo(),
                    12.hSpace,
                    Expanded(
                        child: AppTextButton(
                      iconImgPath: learnIcon,
                      onTap: () {
                        Get.find<HomeController>().currentIndex.value = 1;
                      },
                    )),
                    Expanded(
                        child: AppTextButton(
                      iconImgPath: practiceIcon,
                      onTap: () {
                        Get.find<HomeController>().currentIndex.value = 2;
                      },
                    )),
                    Expanded(
                        child: AppTextButton(
                      iconImgPath: quizIcon,
                      onTap: () {},
                    )),
                    // Expanded(
                    //     child: AppTextButton(
                    //   iconImgPath: createIcon,
                    //   onTap: () {},
                    // )),
                    Expanded(
                        child: AppTextButton(
                      iconImgPath: loginIcon,
                      onTap: () {
                        Get.find<HomeController>().currentIndex.value = 3;
                      },
                    )),
                    Expanded(
                        child: AppTextButton(
                      iconImgPath: signinIcon,
                      onTap: () {},
                    )),
                  ],
                ));
          } else {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextLogo(),
                    300.hSpace,
                    Expanded(
                        child: AppTextButton(
                      text: 'Learning',
                      iconImgPath: learnIcon,
                      onTap: () {
                        Get.find<HomeController>().currentIndex.value = 1;
                        if (quizClick == true) {
                          Get.defaultDialog(
                            barrierDismissible: true,
                            title:
                                'Quiz srceen is open do you want to go to anothor page',
                            titleStyle: Theme.of(context).textTheme.titleMedium,
                            // backgroundColor: Color(0xff2b2d30),
                            backgroundColor: Theme.of(context).canvasColor,
                            radius: 10,
                            contentPadding: const EdgeInsets.all(50),
                            content: OrangeButton(
                              text: 'OK',
                              onTap: () {
                                quizClick = false;
                                Get.find<HomeController>().currentIndex.value =
                                    1;
                                Get.back();
                              },
                            ),
                          );
                        }
                      },
                    )),
                    Expanded(
                        child: AppTextButton(
                      text: 'Practice',
                      iconImgPath: practiceIcon,
                      onTap: () {
                        if (quizClick == true) {
                          Get.defaultDialog(
                            barrierDismissible: true,
                            title:
                                'Quiz srceen is open do you want to go to anothor page',
                            titleStyle: Theme.of(context).textTheme.titleMedium,
                            // backgroundColor: Color(0xff2b2d30),
                            backgroundColor: Theme.of(context).canvasColor,
                            radius: 10,
                            contentPadding: const EdgeInsets.all(50),
                            content: OrangeButton(
                              text: 'OK',
                              onTap: () {
                                quizClick = false;
                                Get.find<HomeController>().currentIndex.value =
                                    2;
                                Get.back();
                              },
                            ),
                          );
                        } else {
                          Get.find<HomeController>().currentIndex.value = 2;
                        }
                        // Get.find<HomeController>().currentIndex.value = 2;
                      },
                    )),
                    Expanded(
                        child: AppTextButton(
                      text: 'Quiz',
                      iconImgPath: quizIcon,
                      onTap: () {
                        quizClick = true;
                        if (Get.find<HomeController>().currentIndex.value !=
                            3) {
                          Get.defaultDialog(
                              title: 'Choose the level of Quiz',
                              titleStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              // titleStyle: TextStyle(color: Colors.white,fontSize: 20),
                              //   backgroundColor: Color(0xff2b2d30),
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 10,
                              contentPadding: const EdgeInsets.all(50),
                              content: Container(
                                // height: 200,
                                // width: 300,
                                child: Row(
                                  children: [
                                    OrangeButton(
                                      width: 150,
                                      text: 'Easy',
                                      onTap: () {
                                        controller.fetchQuestions('Easy');

                                        Get.find<HomeController>()
                                            .currentIndex
                                            .value = 3;
                                        Get.back();
                                      },
                                    ),
                                    10.hSpace,
                                    OrangeButton(
                                      width: 150,
                                      text: 'Medium',
                                      onTap: () {
                                        controller.fetchQuestions('Medium');
                                        controller.currentQuestionIndex.value =
                                            0;
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
                                    10.hSpace,
                                    OrangeButton(
                                      width: 150,
                                      text: 'Hard',
                                      onTap: () {
                                        controller.fetchQuestions('Hard');
                                        controller.currentQuestionIndex.value =
                                            0;
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
                                    )

                                    // GestureDetector(
                                    //       onTap: () {
                                    //         Get.find<HomeController>().currentIndex.value = 3;
                                    //         Get.back();
                                    //       },
                                    //       child: Container(
                                    //         height: 35,
                                    //         width: 110,
                                    //         decoration: BoxDecoration(
                                    //           border: Border.all(
                                    //             color: Colors.orange,
                                    //             width: 1,
                                    //           ),
                                    //           borderRadius: BorderRadius.circular(20),
                                    //         ),
                                    //         child:Center(child: Text('Easy',
                                    //           style: myTextTheme.titleMedium,
                                    //           // style: TextStyle(color: Colors.white,fontSize: 20),
                                    //         )),
                                    //       ),
                                    //     ),
                                    // 10.hSpace,
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     Get.find<HomeController>().currentIndex.value = 3;
                                    //     Get.back();
                                    //   },
                                    //   child: Container(
                                    //     height: 35,
                                    //     width: 110,
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //         color: Colors.orange,
                                    //         width: 1,
                                    //       ),
                                    //       borderRadius: BorderRadius.circular(20),
                                    //     ),
                                    //     child:Center(child: Text('Medium',
                                    //       style: myTextTheme.titleMedium,
                                    //       // style: TextStyle(color: Colors.white,fontSize: 20),
                                    //     )),
                                    //   ),
                                    // ),
                                    // 10.hSpace,
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     Get.find<HomeController>().currentIndex.value = 3;
                                    //     Get.back();
                                    //   },
                                    //   child: Container(
                                    //     height: 35,
                                    //     width: 110,
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //         color: Colors.orange,
                                    //         width: 1,
                                    //       ),
                                    //       borderRadius: BorderRadius.circular(20),
                                    //     ),
                                    //     child:Center(child: Text('Hard',
                                    //       style: myTextTheme.titleMedium,
                                    //       // style: TextStyle(color: Colors.white,fontSize: 20),
                                    //     )),
                                    //   ),
                                    // ),

                                    // ElevatedButton(onPressed: () {
                                    //   Get.find<HomeController>().currentIndex.value = 3;
                                    //   Get.back();
                                    // }, child: Text('Easy')),
                                    // 10.hSpace,
                                    // ElevatedButton(onPressed: () {
                                    //   Get.find<HomeController>().currentIndex.value = 3;
                                    //   Get.back();
                                    // }, child: Text('Medium')),
                                    // 10.hSpace,
                                    // ElevatedButton(onPressed: () {
                                    //   Get.find<HomeController>().currentIndex.value = 3;
                                    //   Get.back();
                                    // }, child: Text('Hard')),
                                  ],
                                ),
                              ));
                        }

                        // Get.find<HomeController>().currentIndex.value = 3;
                      },
                    )),

// ...
                    Container(
                      height: 30,
                      width: 60,
                      child: AdvancedSwitch(
                        controller: _controller,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        activeChild: const Image(
                          image: AssetImage('assets/images/sun.png'),
                          height: 25,
                          width: 25,
                        ),
                        inactiveChild: const Image(
                          image: AssetImage('assets/images/moon.png'),
                          height: 20,
                          width: 20,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        width: 60.0,
                        height: 30.0,
                        enabled: true,
                        disabledOpacity: 0.5,
                        thumb: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.orange,
                                  spreadRadius: 4,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: (value) {
                          toggleTheme();
                        },
                      ),
                    ),
                    // Container(
                    //   height: 30,
                    //   width: 60,
                    //   child: DayNightSwitch(
                    //     value:  true,
                    //     moonImage: AssetImage('assets/moon.png'),
                    //     sunImage: AssetImage('assets/sun.png'),
                    //     sunColor: Colors.orange,
                    //     moonColor: Colors.indigo,
                    //     dayColor: Colors.orange,
                    //     nightColor: Colors.indigoAccent,
                    //     onChanged: (value) {
                    //       toggleTheme();
                    //     },
                    //   ),
                    // )

                    // Expanded(
                    //     child: AppTextButton(
                    //   text: 'mode',
                    //   iconImgPath: createIcon,
                    //   onTap: () {},
                    // )),

                    // OrangeButton(
                    //   text: 'Login',
                    //   onTap: () {
                    //     Get.find<HomeController>().currentIndex.value = 4;
                    //
                    // },),
                    // 10.hSpace,
                    // OrangeButton(
                    //   text: 'Signup',
                    //   onTap: () {
                    //
                    // },)

                    // Container(
                    //   height: 35,
                    //   width: 110,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(button_bg), fit: BoxFit.fill),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(8),
                    //     child: Row(
                    //       children: [
                    //         5.hSpace,
                    //         Image.asset(
                    //           loginIcon,
                    //           height: 20,
                    //           width: 20,
                    //         ),
                    //         5.hSpace,
                    //         Text(
                    //           'Log In',
                    //           style: myTextTheme.titleMedium?.copyWith(fontSize: 15),
                    //           // style: TextStyle(
                    //           //     color: Colors.white,
                    //           //     fontSize: 15,
                    //           //     fontWeight: FontWeight.bold),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // 20.hSpace,
                    // Container(
                    //   height: 35,
                    //   width: 110,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(button_bg), fit: BoxFit.fill),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(8),
                    //     child: Row(
                    //       children: [
                    //         5.hSpace,
                    //         Image.asset(
                    //           signinIcon,
                    //           height: 20,
                    //           width: 20,
                    //         ),
                    //         5.hSpace,
                    //         Text(
                    //           'Sign In',
                    //           style: myTextTheme.titleMedium?.copyWith(fontSize: 15),
                    //           // style: TextStyle(
                    //           //     color: Colors.white,
                    //           //     fontSize: 15,
                    //           //     fontWeight: FontWeight.bold),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ));
          }
        },
      ),
    );
  }
}
