import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  LoginWithEmailAndPasswordUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute({
    required String email,
    required String password,
  }) async {
    return await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
