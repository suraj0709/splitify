import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splitify/Screens/home_page.dart';
import 'package:splitify/Screens/splash_screen.dart';
import 'Screens/chat.dart';
import 'Screens/login.dart';

import 'Screens/login_otp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen': (context) => const MySplashScreen(),
      'login': (context) => const MyPhone(),
      'login_otp': (context) => const MyOtp(),
      'home_page': (context) => const MyHomePage(),
      'chat': (context) => const MyChat(),
    },
  ));
}


