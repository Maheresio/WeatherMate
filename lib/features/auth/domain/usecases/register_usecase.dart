import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class RegisterWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  RegisterWithEmailAndPasswordUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute({
    required String email,
    required String password,
    required String username,
  }) async {
    return await authRepository.registerWithEmailAndPassword(
      email: email,
      password: password,
      username: username,
    );
  }
}
