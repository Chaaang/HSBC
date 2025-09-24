import 'package:hsbc/features/auth/domain/entities/login_response.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login(String username, String password);
}
