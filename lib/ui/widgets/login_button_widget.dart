import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;

  const LoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed as void Function()?,
      child: isLoading
          ? SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue,
                ),
                strokeWidth: 2,
              ),
            )
          : Text(text),
    );
  }
}
