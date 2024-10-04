import 'package:flutter/material.dart';
import 'package:foods_app/model/food_model.dart';

class ProductDetails extends StatefulWidget {
  final FoodModel foodDetails;
  const ProductDetails({super.key, required this.foodDetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.foodDetails.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.foodDetails.foodName,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.foodDetails.desc,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                for (int i = 0; i < int.parse(widget.foodDetails.rating); i++)
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
