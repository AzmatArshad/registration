
import 'package:flutter/material.dart';
import 'package:login/screens/confermation.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/registration_screen.dart';
import 'package:login/screens/splash.dart';
import 'package:login/screens/welcome_screen.dart';

void main() => runApp(Speedo());

class Speedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

       initialRoute:'/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/confermation': (context) => Confermation(),
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/registration_screen': (context) => RegistrationScreen(),
      },


    );
  }
}