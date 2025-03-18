import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'failure.dart';

class ErrorHandler extends Failure {
  ErrorHandler(super.message);

  factory ErrorHandler.fromException(dynamic error) {
    String message = _handleError(error);
    return ErrorHandler(message);
  }

  static String _handleError(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleFirebaseAuthException(error);
    } else if (error is FirebaseException) {
      return _handleFirebaseStorageException(error);
    } else if (error is PlatformException) {
      return _handlePlatformException(error);
    } else if (error is TimeoutException) {
      return _handleTimeoutException(error);
    } else if (error is HttpException) {
      return _handleHttpException(error);
    } else if (error is FormatException) {
      return _handleFormatException(error);
    } else if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (error is MissingPluginException) {
      return "A required plugin is missing. Please ensure all dependencies are properly configured.";
    } else if (error is UnimplementedError) {
      return "This feature is not implemented on the current platform.";
    } else if (error is AssertionError) {
      return "An assertion error occurred. Please report this issue.";
    } else if (error is RangeError) {
      return "A value is out of range.";
    } else if (error is TypeError) {
      return "A type conversion error occurred.";
    } else if (error is StateError) {
      return "Invalid state operation attempted.";
    } else if (error is ArgumentError) {
      return "Invalid argument provided to an operation.";
    } else if (error is UnsupportedError) {
      return "An unsupported operation was attempted.";
    } else if (error is ConcurrentModificationError) {
      return "Collection was modified during iteration.";
    } else if (error is Exception) {
      return _handleGenericException(error);
    } else if (error is String) {
      return error; // Handle string errors
    }

    // Fallback for unknown errors
    return "An unknown error occurred: $error";
  }

  static String _handleFirebaseAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case "invalid-email":
        return "Your email address is not valid.";
      case "wrong-password":
        return "The password is incorrect.";
      case "user-not-found":
        return "No user found with this email.";
      case "user-disabled":
        return "This account has been disabled.";
      case "too-many-requests":
        return "Too many requests, try later!";
      case "INVALID_LOGIN_CREDENTIALS":
      case "invalid-credential":
        return "Email or password is invalid!";
      case "email-already-in-use":
        return "An account already exists with this email.";
      case "operation-not-allowed":
        return "This authentication method is not enabled.";
      case "weak-password":
        return "The password is too weak.";
      case "invalid-verification-code":
        return "the verification code is not valid.";
      case "invalid-verification-id":
        return "the verification ID is not valid.";
      case "network-request-failed":
        return "A network error occurred. Please check your connection.";
      case "account-exists-with-different-credential":
        return "An account with this email already exists. Use a different sign-in method.";
      case "user-token-expired":
        return "no longer authenticated, Sign in again.";
      case 'popup-closed-by-user':
        return "Sign in window was closed";
      case "user-mismatch":
        return "No user match!";
      case "expired-action-code":
        return "OTP expires, resend it!";
      case "credential-already-in-use":
        return "This credential is already associated with another account.";
      case "requires-recent-login":
        return "Please log in again to perform this action.";
      case "quota-exceeded":
        return "The project's quota has been exceeded.";
      case "captcha-check-failed":
        return "Captcha verification failed.";
      case "app-not-authorized":
        return "This app is not authorized to use Firebase Authentication.";
      case "app-deleted":
        return "The Firebase app has been deleted.";
      case "argument-error":
        return "An invalid argument was provided.";
      case "invalid-user-token":
        return "The user token is invalid.";
      case "web-storage-unsupported":
        return "Browser storage is not supported or disabled.";
      case "tenant-id-mismatch":
        return "The tenant ID does not match.";
      case "multi-factor-auth-required":
        return "Multi-factor authentication is required.";
      case "provider-already-linked":
        return "The provider is already linked to the account.";
      case "invalid-api-key":
        return "The API key is invalid or not authorized.";
      case "timeout":
        return "The operation has timed out. Try again.";
      case "unauthorized-domain":
        return "The domain used for sign-in is not authorized.";
      default:
        return "An unknown Firebase Auth error occurred.";
    }
  }

  static String _handlePlatformException(PlatformException error) {
    switch (error.code) {
      case "ERROR_ALREADY_IN_USE":
        return "The resource is already in use.";
      case "ERROR_CREDENTIAL_ALREADY_IN_USE":
        return "This credential is already associated with another account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "This operation is not allowed. Please enable it in Firebase Console.";
      case "ERROR_MISSING_PLUGIN":
        return "A required plugin is missing. Check your platform dependencies.";
      case "ERROR_NETWORK_REQUEST_FAILED":
        return "A network error occurred. Please check your internet connection.";
      case 'sign_in_failed':
        return 'Sign in failed';
      case 'network_error':
        return 'Network error occurred';
      default:
        return "An unexpected platform error occurred.";
    }
  }

  static String _handleTimeoutException(TimeoutException error) {
    return "The connection has timed out. Please try again.";
  }

  static String _handleHttpException(HttpException error) {
    return "Failed to connect to the server.";
  }

  static String _handleFormatException(FormatException error) {
    return "Invalid data format received.";
  }

  static String _handleFirebaseStorageException(FirebaseException error) {
    switch (error.code) {
      case "object-not-found":
        return "The requested file does not exist.";
      case "unauthorized":
        return "You are not authorized to perform this action.";
      case "quota-exceeded":
        return "The storage quota has been exceeded.";
      case "unknown":
        return "An unknown storage error occurred.";
      default:
        return "A storage error occurred.";
    }
  }

  static String _handleGenericException(Exception error) {
    return "An unexpected error occurred: ${error.toString()}";
  }
}
