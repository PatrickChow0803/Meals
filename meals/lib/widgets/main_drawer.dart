import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            color: Colors.black54,
            padding: EdgeInsets.all(20.0),
            // Determines where the child should be aligned,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            // Default categories screen
            Navigator.pushNamed(context, '/');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.pushNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
