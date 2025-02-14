import 'package:get_it/get_it.dart';
import 'package:weather_mate/features/auth/data/auth_repository_impl.dart';
import 'package:weather_mate/features/auth/data/firebase_auth_data_source.dart';

final getIt = GetIt.instance;

setupServicelocator() {
  getIt.registerSingleton<FirebaseAuthDataSourceImpl>(
    FirebaseAuthDataSourceImpl(),
  );

  getIt.registerSingleton<AuthRepositoryImpl>(
    AuthRepositoryImpl(getIt.get<FirebaseAuthDataSourceImpl>()),
  );
}
