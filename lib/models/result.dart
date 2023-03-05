/// Helping model for returning errors or results from store to widgets.
class Result<T> {
  bool succesfull;
  T? result;
  Exception? exception;

  Result({required this.succesfull, this.exception, this.result});
}
