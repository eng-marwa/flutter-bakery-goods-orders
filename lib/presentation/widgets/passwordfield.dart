import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login/login_viewmodel/login_bloc.dart';
import '../auth/login/login_viewmodel/login_event.dart';
import '../auth/login/login_viewmodel/login_state.dart';

Widget PasswordField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Password',
      ),
      validator: (value) =>
          state.isValidPassword ? null : 'Password is not valid',
      onChanged: (value) => context.read<LoginBloc>().add(
            LoginPasswordChanged(value),
          ),
    );
  });
}
