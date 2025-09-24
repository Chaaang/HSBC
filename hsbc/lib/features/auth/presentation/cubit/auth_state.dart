// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hsbc/features/auth/domain/repo/auth_repo.dart';
// import 'package:hsbc/features/auth/presentation/cubit/auth_cubit.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final AuthRepo authRepo;
//   String? _currentUserAuth;
//   AuthCubit({required this.authRepo}) : super(AuthInitial());

//   Future<void> checkAuth() async {
//     await Future.delayed(const Duration(seconds: 2));
//     emit(UnAuthenticated());
//   }

//   Future<void> login(String username, String password) async {
//     try {
//       emit(AuthLoading());

//       final user = await authRepo.login(username, password);

//       if (user != null) {
//         _currentUserAuth = user.id;
//         emit(Authenticated(user));
//       } else {
//         emit(AuthError("Invalid username or password"));
//       }
//     } catch (e) {
//       emit(AuthError(e.toString()));
//       emit(UnAuthenticated());
//     }
//   }

//   String? get currentUser => _currentUserAuth;
// }

import 'package:hsbc/features/auth/domain/entities/login_response.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final LoginResponse user;

  Authenticated(this.user);
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
