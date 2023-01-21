abstract class CartStatus {
  const CartStatus();
}

class LoadingStatus extends CartStatus {}

class SuccessStatus extends CartStatus {}

class ItemDeleted extends CartStatus {}

class ItemAdded extends CartStatus {}

class NoItems extends CartStatus {}

class FailedStatus extends CartStatus {
  final String failureMessage;

  FailedStatus(this.failureMessage);
}
