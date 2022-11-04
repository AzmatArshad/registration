import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  // const RoundedButton({
  //   Key? key,
  // }) : super(key: key);


  RoundedButton(
      {required this.title, required this.colour, required this.onPress});

  final Color colour;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        // color: Colors.lightBlueAccent,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          // onPressed: () {
          //   //Go to login screen.
          //   Navigator.pushNamed(context, LoginScreen.id);
          // },
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            // 'Log In',
            title,
          ),
        ),
      ),
    );
  }
}