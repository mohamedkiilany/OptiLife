import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:optilife_app/features/auth/data/auth_repository.dart';
import 'package:optilife_app/features/profile/data/profile_repository.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';

enum AuthStatus { initial, loading, success, resetting, failure, resetSent }

class AuthState {
  AuthState({this.status = AuthStatus.initial, this.message, this.profile});

  AuthStatus status;
  String? message;
  UserProfile? profile;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository, this.profileRepository) : super(AuthState());

  AuthRepository authRepository;
  ProfileRepository profileRepository;

  // Login
  Future<void> signIn({required String email, required String password}) async {
    emit(AuthState(status: AuthStatus.loading));

    try {
      User user = await authRepository.signIn(email: email, password: password);

      UserProfile? profile = await profileRepository.fetch(user.uid);

      emit(AuthState(status: AuthStatus.success, profile: profile));
    } on FirebaseAuthException catch (e) {
      emit(AuthState(status: AuthStatus.failure, message: authMessage(e.code)));
    } on FirebaseException {
      emit(
        AuthState(
          status: AuthStatus.failure,
          message: 'Could not load your profile. Check your connection and try again.',
        ),
      );
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  // Sign Up
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthState(status: AuthStatus.loading));

    try {
      User user = await authRepository.signUp(
        name: name,
        email: email,
        password: password,
      );

      await profileRepository.createInitial(
        uid: user.uid,
        name: name,
        email: email,
      );

      emit(AuthState(status: AuthStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(AuthState(status: AuthStatus.failure, message: authMessage(e.code)));
    } catch (e) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          message: 'Could not create your profile. Please try again.',
        ),
      );
    }
  }

  // Reset Password
  Future<void> sendPasswordReset(String email) async {
    emit(AuthState(status: AuthStatus.resetting));
    const sentMsg =
        'If an account exists for this email, a reset link has been sent. Check your inbox and spam folder.';
    try {
      await authRepository.sendPasswordReset(email);
      emit(AuthState(status: AuthStatus.resetSent, message: sentMsg));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthState(status: AuthStatus.resetSent, message: sentMsg));
      } else {
        emit(
          AuthState(status: AuthStatus.failure, message: authMessage(e.code)),
        );
      }
    } catch (_) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  // Logout
  Future<void> signOut() async {
    await authRepository.signOut();

    emit(AuthState());
  }

  // Error Messages
  String authMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'That email address is not valid.';

      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'email-already-in-use':
        return 'An account already exists with this email.';

      case 'weak-password':
        return 'Password is too weak. Use at least 8 characters.';

      case 'too-many-requests':
        return 'Too many attempts. Try again in a few minutes.';

      case 'network-request-failed':
        return 'No internet connection.';

      case 'operation-not-allowed':
        return 'Email/password sign-in is not enabled in Firebase.';

      default:
        return 'Authentication failed.';
    }
  }
}
