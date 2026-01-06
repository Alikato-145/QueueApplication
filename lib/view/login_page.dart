import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_queue_app/components/my_button.dart';
import 'package:smart_queue_app/components/my_dialog.dart';
import 'package:smart_queue_app/components/my_textfield.dart';
import 'package:smart_queue_app/viewmodel/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback ontap;
  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _onLogin(AuthViewModel vm) async {
    final success = await vm.login(
      _emailController.text,
      _passwordController.text,
    );
    if (!mounted) return;
    if (!success) {
      AppDialog.show(
        context: context,
        title: "Login Failed",
        message: vm.error ?? "Please check your email or password",
        icon: Icons.error_outline,
        iconColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();
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
            MyButton(text: "Login", onPressed: () => _onLogin(authVM)),
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
                  onTap: widget.ontap,
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
