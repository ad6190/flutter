import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_item.dart';
import '../sample_data/dummy-data.dart';

class Recipes extends StatefulWidget {

  final List<Recipe> filteredRecipes;

  Recipes(this.filteredRecipes);

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String CuisineTitle = routeArgs['title'];
    final String CuisineId = routeArgs['id'];


    final cuisineRecipes = widget.filteredRecipes.where((recipe) {
      return recipe.cuisines.contains(CuisineId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(CuisineTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return RecipeItem(
              id: cuisineRecipes[idx].id,
              title: cuisineRecipes[idx].title,
              imageUrl: cuisineRecipes[idx].imageUrl,
              duration: cuisineRecipes[idx].duration,
              complexity: cuisineRecipes[idx].complexity,
              affordability: cuisineRecipes[idx].affordability,
            );
          },
          itemCount: cuisineRecipes.length,
        ));
  }
}
