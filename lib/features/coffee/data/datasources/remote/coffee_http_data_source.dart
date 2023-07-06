import 'package:coffeeapp/features/coffee/data/models/coffee.dart';

abstract class CoffeeRemoteDataSource {
  Future<List<Coffee>> fetchCoffees();
}
