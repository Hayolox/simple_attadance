part of 'example_cubit.dart';

class ExampleState extends Equatable {
  const ExampleState({
    required this.exampleLocalState,
    required this.exampleRemoteState,
  });

  final ViewData<ExampleModelResponse> exampleLocalState;
  final ViewData<ExampleModelResponse> exampleRemoteState;

  ExampleState copyWith({
    ViewData<ExampleModelResponse>? exampleLocalState,
    ViewData<ExampleModelResponse>? exampleRemoteState,
  }) {
    return ExampleState(
      exampleLocalState: exampleLocalState ?? this.exampleLocalState,
      exampleRemoteState: exampleRemoteState ?? this.exampleRemoteState,
    );
  }

  @override
  List<Object> get props => [
        exampleLocalState,
        exampleRemoteState,
      ];
}
