import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login/screens/driver_screen.dart';
import 'package:login/screens/passenger_screen.dart';

import '../Authentication/custom_user_authentication.dart';
import 'confermation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static String id = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  CustomeUserAuthentication userAuthentication = CustomeUserAuthentication();
  @override
  void initState() {
    //  TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      if (await userAuthentication.tryAutoLogin()) {
        userAuthentication.isDriver != null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DriverScreen()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PassengerScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Confermation()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      //automaticallyImplyleading: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/image/car_icon.png"),
          ),
          SizedBox(
            height: 50,
          ),
          SpinKitFadingCircle(
            color: Colors.red,
            size: 50.0,
          )
        ],
      ),
    ));
  }
}

/*
home:AnimatedSplashScreen(
//width: double.infinity,
//automaticallyImplyleading: false,

// splash: Image.asset('assets/image/back.jpeg'), nextScreen: Confermation(),*/
