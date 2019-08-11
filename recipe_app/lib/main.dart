import 'package:flutter/material.dart';
import './screens/recipes.dart';
import './screens/cuisines.dart';
import './screens/recipe_detail.dart';
import './screens/tabs.dart';
import './screens/filters.dart';
import './models/recipe.dart';
import './sample_data/dummy-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Recipe> filteredRecipes = DUMMY_RECIPES;
  List<Recipe> favouriteRecipes = [];

  void toggleFavourite(String recipeId) {
    final existingIndex =
        favouriteRecipes.indexWhere((recipe) => recipe.id == recipeId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteRecipes.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteRecipes
            .add(DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId));
      });
    }
  }

  bool isFavourite(String recipeId){
    return favouriteRecipes.any((recipe) => recipe.id == recipeId);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      filteredRecipes = DUMMY_RECIPES.where((recipe) {
        if (filters['gluten'] && !recipe.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !recipe.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !recipe.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !recipe.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
//      home: MyHomePage(),
      routes: {
        '/': (ctx) => Tabs(favouriteRecipes),
        '/cuisine-recipes': (ctx) => Recipes(filteredRecipes),
        '/recipe-detail': (ctx) => RecipeDetail(toggleFavourite, isFavourite),
        '/filters': (ctx) => Filters(filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes"),
        ),
        body: Cuisines());
  }
}
