import 'package:flutter/material.dart';
import 'package:login/Authentication/custom_user_authentication.dart';
import 'package:login/screens/confermation.dart';
import 'package:login/screens/welcome_screen.dart';

import '../constants.dart';

class DriverScreen extends StatelessWidget {
  DriverScreen({super.key});
  CustomeUserAuthentication userAuthentication = CustomeUserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Driver..."),
          TextButton.icon(
            onPressed: () {
              CustomeUserAuthentication userAuthentication =
                  CustomeUserAuthentication();
              userAuthentication.logoutUser().then((value) =>
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Confermation())));
            },
            icon: const Icon(Icons.login_rounded),
            label: const Text("LogOut"),
          ),
        ],
      ),
    ));
  }
}
