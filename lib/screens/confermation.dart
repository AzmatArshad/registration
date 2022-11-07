import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';

class Confermation extends StatefulWidget {
  static String id = 'confermation';
  Confermation({Key? key}) : super(key: key);

  @override
  State<Confermation> createState() => _ConfermationState();
}

class _ConfermationState extends State<Confermation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /*  SizedBox(
              width: 80.0,
            ),*/
              SizedBox(
                height: 250.0,
              ),
              Center(
                child: Hero(
                  tag: 'heroAnimate',
                  child: Container(
                    child: Text(
                      "SpeedO",
                      style: TextStyle(
                        fontSize: 45.0,
                        color: Colors.redAccent,
                        /* decoration: TextDecoration.underline,*/
                        decorationColor: Colors.redAccent,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                      ),
                      /*child: Image.asset('images/logo.png'),*/
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 220.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 19.0),
                    child: Material(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          /* Navigator.pushNamed(context, WelcomeScreen.id);*/
                          /* Navigator.push(context, WelcomeScreen.id);*/
                          /* Navigator.push(context, WelcomeScreenRoute(build: (context => WelcomeScreen,))*/
                          setState(() {
                            isDriver = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                        },
                        minWidth: 100.0,
                        height: 42.0,
                        child: Text(
                          'Pasenger',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 19.0),
                    child: Material(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          /* Navigator.pushNamed(context, WelcomeScreen.id);*/
                          setState(() {
                            isDriver = true;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                        },
                        minWidth: 100.0,
                        height: 42.0,
                        child: Text(
                          'Driver',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
