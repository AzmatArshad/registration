import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            SizedBox(
              width: 80.0,
            ),

            Hero(
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

            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              // decoration: InputDecoration(
              //   hintText: 'Enter your email',
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //   ),
              //   enabledBorder: OutlineInputBorder(
              //     borderSide:
              //         BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              //     borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //   ),
              //   focusedBorder: OutlineInputBorder(
              //     borderSide:
              //         BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              //     borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //   ),
              // ),
              decoration: kTextBoxDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.redAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.redAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}