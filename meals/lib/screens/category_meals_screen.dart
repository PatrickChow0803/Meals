import 'package:flutter/material.dart';
import 'package:meals/models/meal_data.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:provider/provider.dart';

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
    final categoryMeals = Provider.of<MealData>(context).meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
