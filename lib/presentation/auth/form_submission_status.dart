import 'package:hnflutter_challenge/app/failure.dart';

abstract class FormSubmissionStatus{
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus{}
class FormSubmitting extends FormSubmissionStatus{}
class SubmissionSuccess extends FormSubmissionStatus{}
class SubmissionFailed extends FormSubmissionStatus{
  final String failureMessage;
  SubmissionFailed(this.failureMessage);
}