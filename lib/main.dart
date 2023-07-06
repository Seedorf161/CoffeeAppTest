import 'package:coffeeapp/features/coffee/views/pages/coffees_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.brown, brightness: Brightness.dark),
          useMaterial3: true,
          primarySwatch: Colors.brown,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          appBarTheme: const AppBarTheme(
              centerTitle: true, titleTextStyle: TextStyle(fontSize: 22))),
      home: const CoffeesScreen(),
    );
  }
}
