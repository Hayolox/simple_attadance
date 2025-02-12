import 'package:equatable/equatable.dart';
import 'package:mobile_banking/common/error/failure_response.dart';

enum ViewState { initial, loading, error, hasData, noData }

extension ViewStateExtension on ViewState {
  bool get isInitial => this == ViewState.initial;
  bool get isLoading => this == ViewState.loading;
  bool get isError => this == ViewState.error;
  bool get isHasData => this == ViewState.hasData;
  bool get isNoData => this == ViewState.noData;
}

class ViewData<T> extends Equatable {
  final ViewState status;
  final T? data;
  final String message;
  final FailureResponse? failure;

  const ViewData._({
    required this.status,
    this.data,
    this.message = '',
    this.failure,
  });

  factory ViewData.initial() {
    return const ViewData._(status: ViewState.initial);
  }

  factory ViewData.loading({String? message}) {
    return ViewData._(status: ViewState.loading, message: message ?? '');
  }

  factory ViewData.error({
    required String message,
    required FailureResponse? failure,
  }) {
    return ViewData._(
      status: ViewState.error,
      message: message,
      failure: failure,
    );
  }

  factory ViewData.loaded({T? data}) {
    return ViewData._(status: ViewState.hasData, data: data);
  }

  factory ViewData.noData({required String message}) {
    return ViewData._(status: ViewState.noData, message: message);
  }

  @override
  List<Object?> get props => [status, data, message, failure];
}
