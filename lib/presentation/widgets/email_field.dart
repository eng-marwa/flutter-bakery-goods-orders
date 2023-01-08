import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login/login_viewmodel/login_bloc.dart';
import '../auth/login/login_viewmodel/login_event.dart';
import '../auth/login/login_viewmodel/login_state.dart';

Widget EmailField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'email',
      ),
      validator: (value) => state.isValidEmail ? null : 'email is not valid',
      onChanged: (value) => context.read<LoginBloc>().add(
            LoginEmailChanged(value),
          ),
    );
  });
}
