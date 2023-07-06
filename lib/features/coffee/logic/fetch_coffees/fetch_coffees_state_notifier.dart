import 'package:coffeeapp/features/coffee/domain/use_cases/fetch_coffees.dart';
import 'package:coffeeapp/features/coffee/logic/fetch_coffees/fetch_coffees_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchCoffeesNotifier extends StateNotifier<FetchCoffeesState> {
  FetchCoffeesNotifier({required FetchCoffees fetchCoffees})
      : _fetchCoffees = fetchCoffees,
        super(const FetchCoffeesState.initial());

  final FetchCoffees _fetchCoffees;

  Future<void> fetchCoffees() async {
    if (!state.isSuccessful) {
      state = const FetchCoffeesState.loading();
    }

    final result = await _fetchCoffees();

    result.fold(
      (error) => state = FetchCoffeesState.error(error),
      (data) => state = FetchCoffeesState.successful(data: data),
    );
  }
}
