import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            color: Colors.red,
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 24,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('/filters'),
          ),
        ],
      ),
    );
  }
}
