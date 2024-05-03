import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mora_technical_test/common/endpoint/endpoint.dart';
import 'package:mora_technical_test/common/http_client/http_client.dart';
import 'package:mora_technical_test/common/injection/injection.dart';
import 'package:mora_technical_test/constant/exception.dart';

abstract class LoginRepositoryAbstract {
  // Future<UserProfile> login(String username, String password);
  Future<User?> loginGoogle();
}

class LoginRepository implements LoginRepositoryAbstract {
  final HttpClient httpClient;
  final Endpoint endpoint;

  LoginRepository({
    required this.httpClient,
    required this.endpoint,
  });

  // @override
  // Future<UserProfile> login(
  //   String username,
  //   String password,
  // ) async {
  //   try {
  //     final url = endpoint.Login();
  //     final response = await httpClient.post(
  //       url,
  //       null,
  //       {
  //         "email": username,
  //         "password": password,
  //       },
  //     );
  //     ExceptionHandling.handelAPIError(
  //       desireStatusCode: 200,
  //       response: response,
  //     );
  //     return UserProfile.fromJson(response.body);
  //   } on AppException {
  //     rethrow;
  //   } catch (exception) {
  //     throw UnknownException(message: exception.toString());
  //   }
  // }

  @override
  Future<User?> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;
        return user;
      }
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
    return null;
  }

  factory LoginRepository.create() {
    return LoginRepository(
      httpClient: Injection.httpClient,
      endpoint: Injection.endpoint,
    );
  }
}
