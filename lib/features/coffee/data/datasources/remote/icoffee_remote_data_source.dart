import 'dart:convert';
import 'dart:io';
import 'package:coffeeapp/core/coffee_api/coffee_api.dart';
import 'package:coffeeapp/core/errors/exception.dart';
import 'package:coffeeapp/features/coffee/data/datasources/remote/coffee_http_data_source.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:http/http.dart' as http;

class ICoffeeHttpDataSource implements CoffeeRemoteDataSource {
  ICoffeeHttpDataSource({required http.Client client})
      : _client = client,
        _headers = {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        };

  final http.Client _client;
  final Map<String, String> _headers;

  @override
  Future<List<Coffee>> fetchCoffees() async {
    try {
      final url = CoffeeAppAPI.getURL('coffee');
      print(url);
      final response = await _client.get(url, headers: _headers);
      final responseBody = json.decode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        return List<Coffee>.from((responseBody as List)
            .map((e) => Coffee.fromJson(e))
            .toList());
      } else if (response.statusCode == 204 ||
          response.statusCode == 401 ||
          (response.statusCode == 200 && responseBody['code'] == -2)) {
        throw AutorizationException();
      } else if (response.statusCode == 404) {
        //not found
        throw NotFoundException();
      } else if (response.statusCode == 500) {
        //api internal error
        throw RequestInternalException();
      } else {
        //other error
        throw RequestException();
      }
    } catch (e) {
      print("errorFetchCoffees $e");
      throw RequestException(message: e);
    }
  }
}
