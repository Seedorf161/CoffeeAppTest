import 'package:coffeeapp/features/coffee/views/widgets/coffee_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffeeapp/core/extensions/widget_context.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:coffeeapp/features/coffee/logic/fetch_coffees/fetch_coffees_provider.dart';
import 'package:coffeeapp/features/coffee/logic/fetch_coffees/fetch_coffees_state.dart';

class CoffeeListViewWidget extends ConsumerStatefulWidget {
  const CoffeeListViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoffeeListViewWidgetState();
}

class _CoffeeListViewWidgetState extends ConsumerState<CoffeeListViewWidget> {
  @override
  void initState() {
    final fetchCoffeeListingState = ref.read(fetchCoffeesNotifierProvider);

    if (fetchCoffeeListingState.uninitialized) {
      SchedulerBinding.instance.addPostFrameCallback((_) =>
          ref.read(fetchCoffeesNotifierProvider.notifier).fetchCoffees());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchCoffeeListingState = ref.watch(fetchCoffeesNotifierProvider);

    final coffeeListing = fetchCoffeeListingState.whenOrNull<List<Coffee>?>(
        successful: (data) => data);

    if (fetchCoffeeListingState.uninitialized ||
        (fetchCoffeeListingState.isLoading &&
            (coffeeListing?.isEmpty ?? true))) {
      return const Center(child: CircularProgressIndicator());
    } else if (fetchCoffeeListingState.isError &&
        (coffeeListing?.isEmpty ?? true)) {
      return Center(
        child: CupertinoButton(
          onPressed: () =>
              ref.read(fetchCoffeesNotifierProvider.notifier).fetchCoffees(),
          child: const Text('Tap to retry'),
        ),
      );
    } else if (fetchCoffeeListingState.isSuccessful &&
        (coffeeListing?.isEmpty ?? true)) {
      return const Center(child: Text("Nothing to show"));
    }

    return RefreshIndicator(
      onRefresh: () async =>
          await ref.read(fetchCoffeesNotifierProvider.notifier).fetchCoffees(),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: (context.width / 2) / 220,
        ),
        itemBuilder: (_, i) => CoffeeItemWidget(coffee: coffeeListing[i]),
        itemCount: coffeeListing!.length,
      ),
    );
  }
}
