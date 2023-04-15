import 'package:flutter/material.dart';
import 'package:fridger_app/ui/screens/home_screen.dart';
import 'package:fridger_app/ui/widgets/login_button_widget.dart';
import 'package:fridger_app/ui/widgets/text_input_widget.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fridger Alpha 0.0'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInput(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            TextInput(
              labelText: 'Password',
              hintText: 'Enter your password',
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            LoginButton(
              text: 'Login',
              onPressed: () {
                // Perform login validation here
                // For demo purposes, let's assume login is successful
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
