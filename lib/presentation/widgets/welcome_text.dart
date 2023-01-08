import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login/login_viewmodel/login_bloc.dart';
import '../auth/login/login_viewmodel/login_state.dart';

Widget WelcomeText(String text) {
    return Text(
      'Welcome $text', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
}