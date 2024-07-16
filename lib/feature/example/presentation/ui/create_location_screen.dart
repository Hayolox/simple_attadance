import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/location_cubit.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/location_state.dart';
import 'package:mobile_banking/feature/example/presentation/ui/attendance_page.dart';

class CreateLocationScreen extends StatelessWidget {
  const CreateLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(),
      child: const CreateLocationView(),
    );
  }
}

class CreateLocationView extends StatelessWidget {
  const CreateLocationView({super.key});

  Future<void> _getLocation(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // ignore: use_build_context_synchronously
    context.read<LocationCubit>().setLocation(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Location'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _getLocation(context),
                child: const Text('Set Current Location as Pin'),
              ),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state is LocationSet) {
                    return Column(
                      children: [
                        Text(
                            'Location: (${state.position.latitude}, ${state.position.longitude})'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    AttendancePage(pinLocation: state.position),
                              ),
                            );
                          },
                          child: const Text('Proceed to Attendance'),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
