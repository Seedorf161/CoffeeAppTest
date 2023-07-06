import 'package:coffeeapp/core/errors/exception.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:coffeeapp/features/coffee/domain/repositories/coffee_repository.dart';
import 'package:dartz/dartz.dart';

class FetchCoffees {
  FetchCoffees({required CoffeeRepository repository})
      : _repository = repository;

  final CoffeeRepository _repository;

  Future<Either<RequestException, List<Coffee>>> call() async =>
      _repository.fetchCoffees();
}
