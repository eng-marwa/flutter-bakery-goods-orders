abstract class ViewProductsStatus{
  const ViewProductsStatus();
}

class Loading extends ViewProductsStatus{}
class Success extends ViewProductsStatus{}
class Failed extends ViewProductsStatus{
  final String failureMessage;
  Failed(this.failureMessage);
}