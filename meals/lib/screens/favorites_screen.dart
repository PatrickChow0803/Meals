import 'package:flutter/material.dart';
import 'package:meals/models/meal_data.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryMeals = Provider.of<MealData>(context).meals;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: categoryMeals[index].id,
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
