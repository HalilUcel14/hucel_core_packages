abstract class IErrorModel<T> {
  void statusCode() {}
}

class BaseError extends IErrorModel {
  final String message;
  BaseError(this.message);
}
