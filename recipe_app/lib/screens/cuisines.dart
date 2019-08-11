import 'package:flutter/material.dart';
import '../screens/cuisine_item.dart';
import '../sample_data/dummy-data.dart';

class Cuisines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),

      children: DUMMY_CUISINES
          .map((cuisine) => CuisineItem(
                cuisine.id,
                cuisine.title,
                cuisine.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
