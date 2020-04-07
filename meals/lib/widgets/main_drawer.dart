import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(String title, IconData icon) {
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
      onTap: () {},
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
          buildListTile('Meals', Icons.restaurant),
          buildListTile('Settings', Icons.settings),
        ],
      ),
    );
  }
}
