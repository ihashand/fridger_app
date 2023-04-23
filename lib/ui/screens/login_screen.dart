import 'package:flutter/material.dart';
import 'package:fridger_app/ui/screens/home_screen.dart';
import 'package:fridger_app/ui/widgets/login_button_widget.dart';
import 'package:fridger_app/ui/widgets/text_input_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.appTitle),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInput(
              labelText: appLocalizations.emailLabel,
              hintText: appLocalizations.emailHint,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            TextInput(
              labelText: appLocalizations.passwordLabel,
              hintText: appLocalizations.passwordHint,
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            LoginButton(
              text: appLocalizations.loginButton,
              onPressed: () {
                // Perform login validation here
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
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
