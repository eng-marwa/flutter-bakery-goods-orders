abstract class ViewProfileStatus{
  const ViewProfileStatus();
}

class Loading extends ViewProfileStatus{}
class Success extends ViewProfileStatus{}
class Failed extends ViewProfileStatus{
  final String failureMessage;
  Failed(this.failureMessage);
}