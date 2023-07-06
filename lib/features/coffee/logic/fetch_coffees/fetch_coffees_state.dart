import 'package:coffeeapp/core/errors/exception.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_coffees_state.freezed.dart';

@freezed
class FetchCoffeesState with _$FetchCoffeesState {
  /// Data is present state
  const factory FetchCoffeesState.successful({required List<Coffee> data}) =
      _FetchCoffeesSuccessfulState;

  /// Initial/default state
  const factory FetchCoffeesState.initial() = _FetchCoffeesInitialState;

  /// Data is loading state
  const factory FetchCoffeesState.loading() = _FetchCoffeesLoadingState;

  /// Error when loading data state
  const factory FetchCoffeesState.error([RequestException? error]) =
      _FetchCoffeesErrorState;
}

extension FetchCoffeesStateExtention on FetchCoffeesState {
  bool get uninitialized => this is _FetchCoffeesInitialState;
  bool get isLoading => this is _FetchCoffeesLoadingState;
  bool get isSuccessful => this is _FetchCoffeesSuccessfulState;
  bool get isError => this is _FetchCoffeesErrorState;
}
