import 'package:mora_technical_test/common/endpoint/endpoint.dart';
import 'package:mora_technical_test/common/http_client/http_client.dart';
import 'package:mora_technical_test/common/injection/injection.dart';
import 'package:mora_technical_test/constant/exception.dart';
import 'package:mora_technical_test/constant/exception_handlind.dart';
import 'package:mora_technical_test/feature/home/domain/models/home_model.dart';

abstract class HomeRepositoryAbstract {
  Future<HomeModel> home();
}

class HomeRepository implements HomeRepositoryAbstract {
  final HttpClient httpClient;
  final Endpoint endpoint;

  HomeRepository({
    required this.httpClient,
    required this.endpoint,
  });

  @override
  Future<HomeModel> home() async {
    try {
      final url = endpoint.home();
      final response = await httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return HomeModel.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  factory HomeRepository.create() {
    return HomeRepository(
      httpClient: Injection.httpClient,
      endpoint: Injection.endpoint,
    );
  }
}
