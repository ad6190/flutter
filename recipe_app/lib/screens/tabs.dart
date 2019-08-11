import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/cuisines.dart';
import '../screens/favourites.dart';
import '../screens/menu.dart';

class Tabs extends StatefulWidget {

  final List<Recipe> favouriteRecipes;

  Tabs(this.favouriteRecipes);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int selectedIndex = 0;

  List<Map<String, Object>> screens;

  @override
  void initState() {
    // TODO: implement initState
    screens = [
      { 'page' : Cuisines(), 'title': 'Cuisines'},
      { 'page' : Favourites(widget.favouriteRecipes), 'title': 'Favourites'}

    ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screens[selectedIndex]['title'])),
      body: screens[selectedIndex]['page'],
      drawer: Menu(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Cuisines'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Favourites'),
        )
      ], onTap: _selectPage,),
    );
  }
}
