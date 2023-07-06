import 'package:coffeeapp/core/errors/exception.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:dartz/dartz.dart';

abstract class CoffeeRepository {
  Future<Either<RequestException, List<Coffee>>> fetchCoffees();
}
