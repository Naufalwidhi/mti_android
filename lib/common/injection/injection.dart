

import 'package:mora_technical_test/common/endpoint/endpoint.dart';
import 'package:mora_technical_test/common/http_client/http_client.dart';

class Injection {
  static final Map<String, String> defaultBearerToken = {
    "Authorization": "Bearer"
  };

  static final HttpClient httpClient = CoinsleekHttpClient.create();
  static final Endpoint endpoint = Endpoint.staging();
}
