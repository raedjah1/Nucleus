abstract class Failure {
  final String _message;

  Failure(this._message);

  String get message => _message;
}

class ApiFailure extends Failure {
  ApiFailure(String message) : super(message);
}

class AppFailure extends Failure {
  AppFailure(String message) : super(message);
}
