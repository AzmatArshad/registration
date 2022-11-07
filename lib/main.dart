import 'package:flutter/material.dart';
import 'package:login/Authentication/custom_user_authentication.dart';
import 'package:login/screens/driver_screen.dart';
import 'screens/confermation.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/splash.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(Speedo());

class Speedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/splash',
      //  initialRoute:'/welcome_screen',
      routes: {
        '/splash': (context) => Splash(),
        '/confermation': (context) => Confermation(),
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/registration_screen': (context) => RegistrationScreen(),
        '/driver_screen': (context) => DriverScreen(),
      },
    );
  }
}
