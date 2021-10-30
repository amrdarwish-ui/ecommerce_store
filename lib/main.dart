import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/languages/controll_language.dart';
import 'package:ecommerce_store/languages/translation.dart';
import 'package:ecommerce_store/view/home/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageControll());
    return GetMaterialApp(
      title: 'Ecommerce Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      home: AnimatedSplashScreen(
          duration: 500,
          splashIconSize: double.infinity,
          splash: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/content.png',
              fit: BoxFit.cover,
            ),
          ),
          nextScreen: ControlView(),
          backgroundColor: primaryGreen),
    );
  }
}
