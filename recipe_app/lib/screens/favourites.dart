import 'package:flutter/material.dart';
import '../screens/recipe_item.dart';
import '../models/recipe.dart';

class Favourites extends StatelessWidget {
  final List<Recipe> favouriteRecipes;

  Favourites(this.favouriteRecipes);

  @override
  Widget build(BuildContext context) {
    if (favouriteRecipes.isEmpty) {
      return Center(
        child: Text('You have no favourite recipes yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return RecipeItem(
            id: favouriteRecipes[idx].id,
            title: favouriteRecipes[idx].title,
            imageUrl: favouriteRecipes[idx].imageUrl,
            duration: favouriteRecipes[idx].duration,
            complexity: favouriteRecipes[idx].complexity,
            affordability: favouriteRecipes[idx].affordability,
          );
        },
        itemCount: favouriteRecipes.length,
      );
    }
  }
}
