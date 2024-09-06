// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/data/repos/device_repo_impl.dart';

import 'package:arena_management/features/home/domain/use_cases/device_usecase/add_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/delete_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/edit_device_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/device_usecase/get_devices_use_case.dart';
import 'package:arena_management/features/home/presentation/manager/device_cubit/device_cubit.dart';
import 'package:arena_management/features/home/presentation/manager/lacale_cubit/locale_cubit.dart';
import 'package:arena_management/router/app_router.dart';
import 'package:arena_management/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());

  // Open Hive boxes
  await Hive.openBox<DeviceModel>('devicesBox');

  runApp(BlocProvider(
    create: (context) => LocaleCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create instances of repositories for cubits
    final deviceRepo =
        DeviceRepoImpl(deviceBox: Hive.box<DeviceModel>('devicesBox'));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceCubit(
              GetDevicesUseCase(deviceRepo),
              AddDeviceUseCase(deviceRepo),
              DeleteDeviceUseCase(deviceRepo),
              EditDeviceUseCase(deviceRepo),
              DeviceRepoImpl(deviceBox: Hive.box<DeviceModel>('devicesBox')))
            ..loadDevices(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            locale: locale,

            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            // supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
