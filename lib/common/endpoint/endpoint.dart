import 'package:mora_technical_test/constant/helper.dart';

class Endpoint {
  final String baseURL;

  Endpoint({
    required this.baseURL,
  });

  Uri home() {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/photos",
    );
  }

  factory Endpoint.staging() {
    return Endpoint(
      baseURL: "jsonplaceholder.typicode.com",
    );
  }
}
