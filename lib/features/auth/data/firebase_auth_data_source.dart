// lib/data/datasources/firebase_auth_data_source.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_mate/features/auth/domain/entity/user_entity.dart';

abstract class FirebaseAuthDataSource {
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserEntity?> getCurrentUser();

  Future<String> refreshToken();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserEntity(
      email: userCredential.user!.email!,
      idToken: await userCredential.user!.getIdToken(),
      uid: userCredential.user!.uid,
      userName: userCredential.user!.displayName,
    );
  }

  @override
  Future<UserEntity> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserEntity(
      email: userCredential.user!.email!,
      idToken: await userCredential.user!.getIdToken(),
    );
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      return UserEntity(
        email: user.email!,
        idToken: await user.getIdToken(),
        uid: user.uid,
        userName: user.displayName,
      );
    }
    return null;
  }

  @override
  Future<String> refreshToken() async {
    final user = _auth.currentUser;
    if (user != null) {
      final idToken = await user.getIdToken(true); // Force refresh
      return idToken!;
    }
    throw Exception("User not logged in");
  }
}
