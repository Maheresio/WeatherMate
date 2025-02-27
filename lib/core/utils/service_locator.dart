import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_mate/features/home/data/data_source/weather_prediction_data_source.dart';
import 'package:weather_mate/features/home/data/repository_impl/weather_prediction_repository_impl.dart';
import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/auth/data/firebase_auth_data_source.dart';
import '../../features/home/data/data_source/weather_remote_data_source.dart';
import '../../features/home/data/repository_impl/weather_repository_impl.dart';
import 'api_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt
    ..registerLazySingleton(() => FirebaseAuthDataSourceImpl())
    ..registerLazySingleton(() => AuthRepositoryImpl(getIt()))
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(() => ApiService(getIt()))
    ..registerLazySingleton(() => WeatherRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton(() => WeatherRepositoryImpl(getIt()))
    ..registerLazySingleton(() => LocationService())
    ..registerLazySingleton(() => WeatherPredictionDataSourceImpl(getIt()))
    ..registerLazySingleton(() => WeatherPredictionRepositoryImpl(getIt()));
}
