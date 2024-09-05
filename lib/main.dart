import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/data/repos/device_repo_impl.dart';
import 'package:arena_management/features/home/data/repos/reservaation_repo_impl.dart';
import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/add_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/delete_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/edit_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/get_devices_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/add_reservation_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/get_reservations_use_case.dart';
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:arena_management/features/home/presentation/pages/home_page.dart';
import 'package:arena_management/features/home/splash/presentation/pages/splash_page.dart';
import 'package:arena_management/router/app_router.dart';
// import 'package:arena_management/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'generated/l10n.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());
  Hive.registerAdapter(ReservationModelAdapter());

  // Open Hive boxes
  await Hive.openBox<DeviceModel>('devicesBox');
  await Hive.openBox<ReservationModel>('reservationsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create instances of repositories for cubits
    final deviceRepo =
        DeviceRepoImpl(deviceBox: Hive.box<DeviceModel>('devicesBox'));
    final reservationRepo = ReservationRepositoryImpl(
        reservationBox: Hive.box<ReservationModel>('reservationsBox'));

    return MultiBlocProvider(
      providers: [
        // Provide DeviceCubit
        BlocProvider(
          create: (context) => DeviceCubit(
            GetDevicesUseCase(deviceRepo),
            AddDeviceUseCase(deviceRepo),
            DeleteDeviceUseCase(deviceRepo),
            EditDeviceUseCase(deviceRepo),
          )..loadDevices(),
        ),
        // Provide ReservationCubit with repository and use cases
        BlocProvider(
          create: (context) => ReservationCubit(
            GetReservationsUseCase(reservationRepo),
            AddReservationUseCase(reservationRepo),
            reservationRepo,
          )..loadReservations(),
        ),
      ],
      child: MaterialApp.router(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
