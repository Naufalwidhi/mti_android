import 'package:firebase_auth/firebase_auth.dart';
import 'package:mora_technical_test/feature/authentication/domain/repository/login_repository.dart';

abstract class LoginServiceAbstract {
  // Future<UserProfile> login(String username, String password);
  Future<User?> loginGoogle();
}

class LoginService implements LoginServiceAbstract {
  final LoginRepositoryAbstract loginService;

  LoginService({
    required this.loginService,
  });

  // @override
  // Future<UserProfile> login(String username, String password) async {
  //   return await loginService.login(username, password);
  // }

  @override
  Future<User?> loginGoogle() async {
    return await loginService.loginGoogle();
  }

  factory LoginService.create() {
    return LoginService(
      loginService: LoginRepository.create(),
    );
  }
}
