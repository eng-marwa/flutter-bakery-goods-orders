abstract class CartStatus {
  const CartStatus();
}

class Loading extends CartStatus {}

class Success extends CartStatus {}

class ItemDeleted extends CartStatus {}

class ItemAdded extends CartStatus {}

class NoItems extends CartStatus {}

class Failed extends CartStatus {
  final String failureMessage;

  Failed(this.failureMessage);
}
