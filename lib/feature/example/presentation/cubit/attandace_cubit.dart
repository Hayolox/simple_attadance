import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final Position pinLocation;

  AttendanceCubit(this.pinLocation) : super(AttendanceInitial());

  Future<void> checkAttendance() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      pinLocation.latitude,
      pinLocation.longitude,
    );

    if (distanceInMeters <= 50) {
      emit(const AttendanceChecked('Attendance accepted'));
    } else {
      emit(const AttendanceChecked(
          'Attendance rejected: too far from the location'));
    }
  }
}
