import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/core/extensions/num_extension.dart';
import 'package:coffeeapp/core/extensions/widget_context.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  const CoffeeDetailsScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coffee.title ?? 'Unknown')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: (coffee.image?.isNotEmpty ?? false)
                  ? CachedNetworkImage(
                      imageUrl: coffee.image!,
                      height: 250,
                      width: context.width,
                      errorWidget: (_, __, ___) =>
                          const Icon(Icons.error, size: 50),
                      placeholder: (_, __) => const FlutterLogo(),
                      fit: BoxFit.cover,
                    )
                  : const FlutterLogo(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (coffee.ingredients?.isNotEmpty ?? false) ...[
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemCount: coffee.ingredients!.length,
                      itemBuilder: (_, i) => Text(
                        '• ${coffee.ingredients![i]}',
                        style: const TextStyle(
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      separatorBuilder: (_, __) => 5.sh,
                    ),
                    10.sh,
                  ],
                  if (coffee.description?.isNotEmpty ?? false) ...[
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.sh,
                    Text(
                      coffee.description!,
                      style: const TextStyle(
                        letterSpacing: 0.4,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
