part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;

  LoginSuccess(this.user);
}

class RegisterSuccess extends AuthState {
  final UserEntity user;

  RegisterSuccess(this.user);
}

class AuthLoading extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
