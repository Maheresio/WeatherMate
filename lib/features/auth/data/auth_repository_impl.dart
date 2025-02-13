import 'package:weather_mate/features/auth/data/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> loginWithEmailAndPassword({required email, required password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmailAndPassword(
      {required email, required password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
