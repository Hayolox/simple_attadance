import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  void setLocation(Position position) {
    emit(LocationSet(position));
  }
}
