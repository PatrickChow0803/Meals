import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // Because app is now using named routes to pass arguments, fields and constructor is no longer needed
//  final String categoryId;
//  final String categoryTitle;
//
//  CategoryMealsScreen({this.categoryId, this.categoryTitle});

  // Used for the namedRoute
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    // This receives the arguments that were passed in category_item.
    // Because I passed in a Map of type <String, String>, should tell Flutter what kind of map it is.
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
