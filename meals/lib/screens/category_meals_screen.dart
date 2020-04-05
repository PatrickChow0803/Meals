import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id = 'CategoryMealsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipes'),
      ),
      body: Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
