import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/failure.dart';
import '../domain/entity/user_entity.dart';
import '../domain/repository/auth_repository.dart';

import '../../../core/error/handle_errors.dart';
import 'firebase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  late final SharedPreferences prefs;

  AuthRepositoryImpl(
    this.firebaseAuthDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await firebaseAuthDataSource.loginWithEmailAndPassword(
          email: email, password: password);

      await _cacheUser(user);

      return Right(user);
    } catch (e) {
      final exception = ErrorHandler.fromException(e);

      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCachedUser() async {
    try {
      final email = prefs.getString('userEmail');
      final idToken = prefs.getString('idToken');
      if (email != null && idToken != null) {
        return Right(UserEntity(email: email, idToken: idToken));
      }
      return const Right(null);
    } catch (e) {
      final exception = ErrorHandler.fromException(e);
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      final newToken = await firebaseAuthDataSource.refreshToken();
      await prefs.setString('idToken', newToken);
      return Right(newToken);
    } catch (e) {
      final exception = ErrorHandler.fromException(e);
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseAuthDataSource.signOut();
      await _clearCache();
      return Right(null);
    } catch (e) {
      final exception = ErrorHandler.fromException(e);
      return Left(Failure(exception.message));
    }
  }

  Future<void> _cacheUser(UserEntity user) async {
    await prefs.setString('userEmail', user.email!);
    await prefs.setString('idToken', user.idToken!);
  }

  Future<void> _clearCache() async {
    await prefs.remove('userEmail');
    await prefs.remove('idToken');
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final user = await firebaseAuthDataSource.registerWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );
      await _cacheUser(user);
      return Right(user);
    } catch (e) {
      final exception = ErrorHandler.fromException(e);
      return Left(Failure(exception.message));
    }
  }
}
