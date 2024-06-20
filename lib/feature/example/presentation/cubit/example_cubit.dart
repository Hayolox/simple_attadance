import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_banking/common/state/view_data_state.dart';
import 'package:mobile_banking/data/model/example/request/example_request_model.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';
import 'package:mobile_banking/domain/usecases/example/example_local_usecase.dart';
import 'package:mobile_banking/domain/usecases/example/example_remote_usecase.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final ExampleRemoteUseCase exampleRemoteUseCase;
  final ExampleLocalUseCase exampleLocalUseCase;
  ExampleCubit({
    required this.exampleRemoteUseCase,
    required this.exampleLocalUseCase,
  }) : super(
          ExampleState(
            exampleLocalState: ViewData.initial(),
            exampleRemoteState: ViewData.initial(),
          ),
        );

  void exampleLocal({
    required ExampleModelRequest request,
  }) async {
    emit(state.copyWith(exampleLocalState: ViewData.loading()));

    final result = await exampleRemoteUseCase.call(request);

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            exampleLocalState: ViewData.error(
              message: failure.errorMessage,
              failure: failure,
            ),
          ),
        );
      },
      (result) => emit(
        state.copyWith(
          exampleLocalState: ViewData.loaded(data: result),
        ),
      ),
    );
  }

  void exampleRemote({
    required ExampleModelRequest request,
  }) async {
    emit(state.copyWith(exampleRemoteState: ViewData.loading()));

    final result = await exampleRemoteUseCase.call(request);

    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            exampleRemoteState: ViewData.error(
              message: failure.errorMessage,
              failure: failure,
            ),
          ),
        );
      },
      (result) => emit(
        state.copyWith(
          exampleRemoteState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
