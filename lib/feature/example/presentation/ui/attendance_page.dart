import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/attandace_cubit.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/attendance_state.dart';

class AttendancePage extends StatelessWidget {
  final Position pinLocation;

  const AttendancePage({Key? key, required this.pinLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceCubit(pinLocation),
      child: const AttendanceView(),
    );
  }
}

class AttendanceView extends StatelessWidget {
  const AttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AttendanceCubit, AttendanceState>(
                builder: (context, state) {
                  if (state is AttendanceChecked) {
                    return Text(state.statusMessage);
                  } else {
                    return const Text('');
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    context.read<AttendanceCubit>().checkAttendance(),
                child: const Text('Check Attendance'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
