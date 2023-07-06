import 'package:coffeeapp/features/coffee/domain/use_cases/fetch_coffees.dart';
import 'package:coffeeapp/features/coffee/logic/coffee_provider.dart';
import 'package:coffeeapp/features/coffee/logic/fetch_coffees/fetch_coffees_state.dart';
import 'package:coffeeapp/features/coffee/logic/fetch_coffees/fetch_coffees_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * Use cases
final _fetchCoffeesProvider = Provider<FetchCoffees>(
  (ref) {
    final repository = ref.watch(coffeeRepository);
    return FetchCoffees(repository: repository);
  },
);

/// Provider to use the FetchCoffeesNotifierProvider
// * Logic holder / StateNotifier

final fetchCoffeesNotifierProvider =
    StateNotifierProvider<FetchCoffeesNotifier, FetchCoffeesState>(
  (ref) => FetchCoffeesNotifier(fetchCoffees: ref.watch(_fetchCoffeesProvider)),
);
