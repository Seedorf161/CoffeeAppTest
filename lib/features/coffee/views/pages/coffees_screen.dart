import 'package:coffeeapp/features/coffee/views/widgets/coffees_grid_view_widget.dart';
import 'package:flutter/material.dart';

class CoffeesScreen extends StatelessWidget {
  const CoffeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coffee')),
      body: const CoffeeListViewWidget(),
    );
  }
}
