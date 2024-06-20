import 'package:equatable/equatable.dart';

class ExampleArgument extends Equatable {
  final String example;

  const ExampleArgument({
    required this.example,
  });

  @override
  List<Object?> get props => [example];
}
