import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_mate/features/auth/domain/usecases/register_usecase.dart';

import '../../../../core/error/handle_exceptions.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/entity/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        final exception = ExceptionHandler.fromException(failure);
        emit(AuthFailure(exception.message));
      },
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AuthLoading());
    final result = await RegisterWithEmailAndPasswordUseCase(authRepository)
        .execute(email: email, password: password, username: username);
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    final result = await authRepository.signOut();
    result.fold(
      (failure) {
        final exception = ExceptionHandler.fromException(failure);
        emit(AuthFailure(exception.message));
      },
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> getCachedUser() async {
    emit(AuthLoading());
    final result = await authRepository.getCachedUser();
    result.fold(
      (failure) {
        final exception = ExceptionHandler.fromException(failure);
        emit(AuthFailure(exception.message));
      },
      (user) {
        if (user != null) {
          emit(AuthSuccess(user));
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }
}
