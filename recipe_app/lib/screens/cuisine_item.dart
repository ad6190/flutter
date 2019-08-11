import 'package:flutter/material.dart';
import '../screens/recipes.dart';

class CuisineItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CuisineItem(this.id, this.title, this.color);

  void selectCuisine(BuildContext context) {
    Navigator.of(context).pushNamed('/cuisine-recipes', arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCuisine(context),
      child: Card(
        elevation: 5,
        color: this.color,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
