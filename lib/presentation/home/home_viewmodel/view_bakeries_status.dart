abstract class ViewBakeriesStatus{
  const ViewBakeriesStatus();
}

class Loading extends ViewBakeriesStatus{}
class Success extends ViewBakeriesStatus{}
class Failed extends ViewBakeriesStatus{
  final String failureMessage;
  Failed(this.failureMessage);
}