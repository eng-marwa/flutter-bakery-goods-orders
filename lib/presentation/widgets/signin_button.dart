import 'package:flutter/material.dart';

Widget SignInButton(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        child: Text('Already have an account? Sign In.'),
        onPressed: () => null,
      ),
    ),
  );
}
