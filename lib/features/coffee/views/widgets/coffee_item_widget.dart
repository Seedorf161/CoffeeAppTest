import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/core/extensions/num_extension.dart';
import 'package:coffeeapp/core/extensions/widget_context.dart';
import 'package:coffeeapp/core/page_builder/navigations.dart';
import 'package:coffeeapp/features/coffee/data/models/coffee.dart';
import 'package:coffeeapp/features/coffee/views/pages/coffee_details_screen.dart';
import 'package:flutter/material.dart';

class CoffeeItemWidget extends StatelessWidget {
  const CoffeeItemWidget({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigate.adaptiveTo(context, CoffeeDetailsScreen(coffee: coffee)),
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: (coffee.image?.isNotEmpty ?? false)
                  ? CachedNetworkImage(
                      imageUrl: coffee.image!,
                      height: 160,
                      width: context.width,
                      errorWidget: (_, __, ___) =>
                          const Icon(Icons.error, size: 50),
                      placeholder: (_, __) => const FlutterLogo(),
                      fit: BoxFit.cover,
                    )
                  : const FlutterLogo(),
            ),
            10.sh,
            Text(
              '  ${coffee.title ?? 'Unknown'}',
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
