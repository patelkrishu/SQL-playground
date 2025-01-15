import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/views/screen/practice_screen.dart';
import 'package:new_sql_playground/views/screen/quiz_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/appbar/responsive_appbar.dart';
import 'landing_screen.dart';
import 'learn_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    List<Widget> body = [
      LandingScreen(),
      LearnScreen(),
      SqlPlayScreen(),
      QuizScreen(),
    ];

    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        children: [
          const ResponsiveAppBar(),
          Expanded(child: Obx(() => body[homeController.currentIndex.value])),
        ],
      ),
    );
  }
}

// this screen is home screen
