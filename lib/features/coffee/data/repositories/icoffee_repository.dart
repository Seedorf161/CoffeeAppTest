import 'package:coffeeapp/core/errors/exception.dart';
import 'package:coffeeapp/core/network_manager/domain/network_manager.dart';
import 'package:coffeeapp/features/coffee/data/datasources/remote/coffee_http_data_source.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:coffeeapp/features/coffee/domain/repositories/coffee_repository.dart';
import 'package:dartz/dartz.dart';

class ICoffeeRepository implements CoffeeRepository {
  ICoffeeRepository({
    required CoffeeRemoteDataSource remoteDataSource,
    required NetworkManager networkManager,
  })  : _remoteDataSource = remoteDataSource,
        _networkManager = networkManager;

  final CoffeeRemoteDataSource _remoteDataSource;
  final NetworkManager _networkManager;

  @override
  Future<Either<RequestException, List<Coffee>>> fetchCoffees() async {
    if (await _networkManager.isConnected) {
      try {
        final res = await _remoteDataSource.fetchCoffees();
        return Right(res);
      } on RequestException catch (e) {
        return Left(e);
      } catch (_) {
        return Left(InternalException());
      }
    } else {
      return Left(ConnectionException());
    }
  }
}
