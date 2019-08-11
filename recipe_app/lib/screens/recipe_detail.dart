import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../sample_data/dummy-data.dart';

class RecipeDetail extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourited;

  RecipeDetail(this.toggleFavourite, this.isFavourited);

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final Recipe selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedRecipe.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, idx) {
                  return Card(
                    margin: EdgeInsets.all(2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedRecipe.ingredients[idx]),
                    ),
                  );
                },
                itemCount: selectedRecipe.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, idx) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${idx + 1}'),
                    ),
                    title: Text(selectedRecipe.steps[idx]),
                  );
                },
                itemCount: selectedRecipe.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(id),
        child: Icon(isFavourited(id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
