import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FailureResponse extends Failure {
  final int statusCode;
  final String errorMessage;
  final String responseCode;

  FailureResponse({
    required this.statusCode,
    required this.errorMessage,
    this.responseCode = '',
  });

  @override
  List<Object> get props => [responseCode, errorMessage, statusCode];
}
