import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hnflutter_challenge/presentation/widgets/welcome_text.dart';
import '../../widgets/email_field.dart';
import '../../widgets/passwordfield.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/signup_button.dart';
import '../form_submission_status.dart';
import 'login_viewmodel/login_bloc.dart';
import 'login_viewmodel/login_event.dart';
import 'login_viewmodel/login_state.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final instance = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(instance()),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _loginForm(),
            SignUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
          ShowSnackBar(context, formStatus.failureMessage);
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(20),child: WelcomeText('Member'),),
                EmailField(),
                PasswordField(),
                LoginButton(),
              ],
            ),
          ),
        ));
  }

  Widget LoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                }
              },
              child: Text('Login'),
            );
    });
  }
}
