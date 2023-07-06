import 'package:coffeeapp/core/network_manager/data/inetwork_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:coffeeapp/features/coffee/data/datasources/remote/icoffee_remote_data_source.dart';
import 'package:coffeeapp/features/coffee/data/repositories/icoffee_repository.dart';
import 'package:coffeeapp/features/coffee/domain/repositories/coffee_repository.dart';

final coffeeRepository = Provider<CoffeeRepository>(
  (_) {
    return ICoffeeRepository(
      networkManager: INetworkManager(InternetConnectionChecker()),
      remoteDataSource: ICoffeeHttpDataSource(client: http.Client()),
    );
  },
);
