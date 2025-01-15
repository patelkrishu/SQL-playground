import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/services/api_services/api_Service.dart';
import 'package:new_sql_playground/utilitys/themes/app_theme.dart';
import 'package:new_sql_playground/views/screen/home_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(ApiService());
  runApp(const Secret());
}

class Secret extends StatelessWidget {
  const Secret({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: mode,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}