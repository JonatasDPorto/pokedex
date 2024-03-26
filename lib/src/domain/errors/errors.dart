class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerError extends Failure {
  const ServerError() : super(message: "Server error!");
}
