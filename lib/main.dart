import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/helpers/firebase_init.dart';
import 'core/helpers/styled_status_bar.dart';
import 'core/utils/api_service.dart';
import 'core/utils/app_router.dart';
import 'core/utils/location_service.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/presentation/controller/auth_cubit.dart';
import 'features/home/data/data_source/weather_remote_data_source.dart';
import 'features/home/data/repository_impl/weather_repository_impl.dart';
import 'features/home/domain/usecases/get_weather_usecase.dart';
import 'features/home/presentation/controller/location/location_cubit.dart';
import 'features/home/presentation/controller/weather/weather_cubit.dart';
import 'features/home/presentation/controller/weather/weather_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  styledStatusBar();

  if (!Platform.isLinux) {
    await firebaseInit();
    setupServicelocator();
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(getIt.get<AuthRepositoryImpl>()),
            ),
            BlocProvider<WeatherCubit>(
              create: (context) => WeatherCubit(
                GetWeatherUsecase(
                  WeatherRepositoryImpl(
                    WeatherRemoteDataSourceImpl(
                      ApiService(Dio()),
                    ),
                  ),
                ),
              )..getWeather('London'),
            ),
            BlocProvider<LocationCubit>(
              create: (context) => LocationCubit(getIt.get<LocationService>()),
            ),
            ChangeNotifierProvider(create: (context) => WeatherProvider()),
          ],
          child: MaterialApp.router(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    ),
  );
}
