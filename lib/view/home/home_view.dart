import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:foods_app/res/components/food_list.dart';
import 'package:foods_app/view/productDetails/product_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final data = foodList[index];
          return OpenContainer(
            transitionDuration: const Duration(milliseconds: 400),
            closedBuilder: (context, action) => Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          data.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.foodName,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.desc,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < int.parse(data.rating); i++)
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                        ],
                      )
                    ],
                  ),
                )),
            openBuilder: (context, action) => ProductDetails(foodDetails: data),
          );
        },
      ),
    );
  }
}
