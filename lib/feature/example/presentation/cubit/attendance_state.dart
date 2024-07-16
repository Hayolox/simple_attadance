import 'package:equatable/equatable.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceChecked extends AttendanceState {
  final String statusMessage;

  const AttendanceChecked(this.statusMessage);

  @override
  List<Object> get props => [statusMessage];
}
