import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationSet extends LocationState {
  final Position position;

  const LocationSet(this.position);

  @override
  List<Object> get props => [position];
}
