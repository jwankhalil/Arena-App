import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/data/repos/device_repo_impl.dart';
import 'package:arena_management/features/home/domain/use_cases/add_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/delete_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/edit_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/get_devices_use_case.dart';
import 'package:arena_management/features/home/presentation/manager/cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/pages/home_page.dart';
// import 'package:arena_management/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'generated/l10n.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());
  await Hive.openBox<DeviceModel>('devicesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceCubit(
              GetDevicesUseCase(
                DeviceRepoImpl(
                  deviceBox: Hive.box('devicesBox'),
                ),
              ),
              AddDeviceUseCase(
                DeviceRepoImpl(
                  deviceBox: Hive.box('devicesBox'),
                ),
              ),
              DeleteDeviceUseCase(
                  DeviceRepoImpl(deviceBox: Hive.box('devicesBox'))),
              EditDeviceUseCase(
                  DeviceRepoImpl(deviceBox: Hive.box('devicesBox'))))
            ..loadDevices(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
