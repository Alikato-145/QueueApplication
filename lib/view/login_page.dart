import 'package:flutter/material.dart';
import 'package:smart_queue_app/components/my_button.dart';
import 'package:smart_queue_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final VoidCallback ontap;
  LoginPage({super.key,required this.ontap});

  //email and pw controllers
  void login() {}
  void signup() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.add_to_queue,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //Name Application
            SizedBox(height: 25),
            Text(
              'Queue Application',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 25),
            //email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            //pw textfield
            SizedBox(height: 15),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            //login button
            SizedBox(height: 15),
            MyButton(text: "Login", onPressed: () {}),
            //register now
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


