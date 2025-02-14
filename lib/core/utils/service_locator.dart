import 'package:get_it/get_it.dart';
import 'package:weather_mate/features/auth/data/auth_repository_impl.dart';
import 'package:weather_mate/features/auth/data/firebase_auth_data_source.dart';

final getIt = GetIt.instance;

setupServicelocator() {
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(getIt.get<FirebaseAuthDataSourceImpl>()),
  );
  getIt.registerLazySingleton<FirebaseAuthDataSourceImpl>(
    () => FirebaseAuthDataSourceImpl(),
  );
}
