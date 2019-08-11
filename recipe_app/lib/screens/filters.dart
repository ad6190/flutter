import 'package:flutter/material.dart';
import '../screens/menu.dart';

class Filters extends StatefulWidget {

  final Function setFilters;

  final Map<String, bool> currentFilter;


  Filters(this.currentFilter, this.setFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    glutenFree = widget.currentFilter['gluten'];
    lactoseFree = widget.currentFilter['lactose'];
    isVegan = widget.currentFilter['vegan'];
    isVegetarian = widget.currentFilter['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: () {

              final filter = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan':isVegan,
                'vegetarian': isVegetarian
              };

              widget.setFilters(filter);
              })
          ],
        ),

        drawer: Menu(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your recipe types.',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Column(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  value: glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  value: lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan Only'),
                  value: isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian Only'),
                  value: isVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  },
                ),
              ],
            )
          ],
        ));
  }
}
