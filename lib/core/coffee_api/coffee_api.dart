import 'package:coffeeapp/core/utils/strings.dart';

class CoffeeAppAPI {
  static final apiBaseUri = Uri.parse(CoffeeAppStringData.apiBaseUri);

  static Uri getURL(String endpoint,
      {String? query, Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: apiBaseUri.scheme,
      host: apiBaseUri.host,
      port: apiBaseUri.port,
      path: '${apiBaseUri.path}/$endpoint',
      query: query,
      queryParameters: queryParameters,
    );
  }
}
