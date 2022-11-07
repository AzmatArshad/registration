import 'package:flutter/material.dart';
import 'package:login/Authentication/custom_user_authentication.dart';

import '../constants.dart';
import 'confermation.dart';
import 'welcome_screen.dart';

class PassengerScreen extends StatelessWidget {
  PassengerScreen({super.key});
  CustomeUserAuthentication userAuthentication = CustomeUserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Passenger..."),
            TextButton.icon(
              onPressed: () {
                CustomeUserAuthentication userAuthentication =
                    CustomeUserAuthentication();
                userAuthentication.logoutUser().then((_) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Confermation()));
                });
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text("LogOut"),
            ),
          ],
        ),
      ),
    );
  }
}
