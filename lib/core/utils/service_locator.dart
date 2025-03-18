import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/auth/data/firebase_auth_data_source.dart';
import '../../features/home/data/data_source/weather_remote_data_source.dart';
import '../../features/home/data/repository_impl/weather_repository_impl.dart';
import 'api_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

setupServicelocator() {
  getIt.registerLazySingleton<FirebaseAuthDataSourceImpl>(
    () => FirebaseAuthDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt.get<FirebaseAuthDataSourceImpl>()),
  );

  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      getIt.get<Dio>(),
    ),
  );

  getIt.registerLazySingleton<WeatherRemoteDataSourceImpl>(
    () => WeatherRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerLazySingleton<WeatherRepositoryImpl>(
    () => WeatherRepositoryImpl(
      getIt.get<WeatherRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton<LocationService>(
    () => LocationService(),
  );
}
