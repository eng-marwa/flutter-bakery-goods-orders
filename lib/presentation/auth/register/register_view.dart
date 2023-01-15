import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hnflutter_challenge/presentation/widgets/welcome_text.dart';
import '../../widgets/email_field.dart';
import '../../widgets/passwordfield.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/signin_button.dart';
import '../form_submission_status.dart';
import 'register_viewmodel/register_bloc.dart';
import 'register_viewmodel/register_event.dart';
import 'register_viewmodel/register_state.dart';

class RegisterView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final instance = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(instance()),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _loginForm(),
            SignInButton(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            ShowSnackBar(context, formStatus.failureMessage);
          }else if(formStatus is SubmissionSuccess){
            print(state.user?.name);
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(20),child: WelcomeText('Guest'),),
                EmailField(),
                PasswordField(),
                PasswordField(),
                RegisterButton(),
              ],
            ),
          ),
        ));
  }

  Widget RegisterButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<RegisterBloc>().add(const RegisterSubmitted());
          }
        },
        child: Text('Create New Account'),
      );
    });
  }
}
