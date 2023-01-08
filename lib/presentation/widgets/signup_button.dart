import 'package:flutter/material.dart';

Widget SignUpButton(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        child: Text('Don\'t have an account? Sign up.'),
        onPressed: () => null,
      ),
    ),
  );
}
