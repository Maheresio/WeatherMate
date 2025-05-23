import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result =
        await LoginWithEmailAndPasswordUseCase(authRepository).execute(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (user) => emit(LoginSuccess(user)),
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
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    final result = await authRepository.signOut();
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> getCachedUser() async {
    emit(AuthLoading());
    final result = await authRepository.getCachedUser();
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (user) {
        if (user != null) {
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }
}
