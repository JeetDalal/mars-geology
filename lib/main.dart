import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marsgeology/on_boarding_screen/boarding_screen1.dart';
import 'package:marsgeology/screens/content_overview.dart';
import 'package:marsgeology/screens/home.dart';
import 'package:marsgeology/screens/login.dart';
import 'package:marsgeology/screens/page_controller.dart';
import 'package:marsgeology/screens/register.dart';
import 'package:marsgeology/screens/research.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/page-controller',
      routes: {
        '/login-screen': (context) => const LoginScreen(),
        '/register-page': (context) => const RegisterPage(),
        '/home-page': (context) => HomePage(),
        '/content-overview': (context) => const ContentOverview(),
        '/page-controller': (context) => PageControllerScreen(),
      },
    );
  }
}
