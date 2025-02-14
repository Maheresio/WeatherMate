import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_mate/core/error/failure.dart';
import 'package:weather_mate/features/auth/domain/entity/user_entity.dart';
import 'package:weather_mate/features/auth/domain/usecases/register_usecase.dart';

import 'auth_test.mocks.dart';

void main() {
  late RegisterWithEmailAndPasswordUseCase registerUseCase;
  late MockAuthRepositoryImpl mockRepository;

  const testEmail = "test@example.com";
  const testPassword = "StrongPass1";
  const testUsername = "TestUser";
  final testUser = UserEntity(email: testEmail, idToken: "fake_token");

  setUp(() {
    mockRepository = MockAuthRepositoryImpl();
    registerUseCase = RegisterWithEmailAndPasswordUseCase(mockRepository);
  });

  group('🧪 RegisterWithEmailAndPasswordUseCase Tests', () {
    test('✅ Should register successfully when credentials are valid', () async {
      // Arrange
      when(mockRepository.registerWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
        username: anyNamed('username'),
      )).thenAnswer((_) async => Right(testUser));

      // Act
      final result = await registerUseCase.execute(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      );

      // Assert
      expect(result, isA<Right<Failure, UserEntity>>());
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception("Error")), testUser);

      verify(mockRepository.registerWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      )).called(1);
    });

    test('❌ Should return failure when email format is invalid', () async {
      // Arrange
      const invalidEmail = "invalid-email";
      when(mockRepository.registerWithEmailAndPassword(
        email: invalidEmail,
        password: testPassword,
        username: testUsername,
      )).thenAnswer((_) async => Left(Failure("Invalid email format")));

      // Act
      final result = await registerUseCase.execute(
        email: invalidEmail,
        password: testPassword,
        username: testUsername,
      );

      // Assert
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure.message, (_) => ""),
          "Invalid email format");
    });

    test('❌ Should return failure when password is too weak', () async {
      // Arrange
      const weakPassword = "12345";
      when(mockRepository.registerWithEmailAndPassword(
        email: testEmail,
        password: weakPassword,
        username: testUsername,
      )).thenAnswer((_) async => Left(Failure("Weak password")));

      // Act
      final result = await registerUseCase.execute(
        email: testEmail,
        password: weakPassword,
        username: testUsername,
      );

      // Assert
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure.message, (_) => ""),
          "Weak password");
    });

    test('❌ Should return failure when email is already in use', () async {
      // Arrange
      when(mockRepository.registerWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      )).thenAnswer((_) async =>
          Left(Failure("The email address is already in use")));

      // Act
      final result = await registerUseCase.execute(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      );

      // Assert
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure.message, (_) => ""),
          "The email address is already in use");
    });

    test('❌ Should return failure when there is a network issue', () async {
      // Arrange
      when(mockRepository.registerWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      )).thenAnswer((_) async => Left(Failure("Network error")));

      // Act
      final result = await registerUseCase.execute(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      );

      // Assert
      expect(result.isLeft(), true);
      expect(result.fold((failure) => failure.message, (_) => ""),
          "Network error");
    });

    test('❌ Should return failure when an unknown error occurs', () async {
      // Arrange
      when(mockRepository.registerWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      )).thenThrow(Exception("An unexpected error occurred"));

      // Act
      final result = await registerUseCase.execute(
        email: testEmail,
        password: testPassword,
        username: testUsername,
      );

      // Assert
      expect(result.isLeft(), true);
    });
  });
}
