abstract class ViewProductStatus{
  const ViewProductStatus();
}

class Loading extends ViewProductStatus{}
class Success extends ViewProductStatus{}
class Failed extends ViewProductStatus{
  final String failureMessage;
  Failed(this.failureMessage);
}