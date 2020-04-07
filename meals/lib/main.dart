import 'package:flutter/material.dart';
import 'package:meals/models/meal_data.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import 'models/category_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the MultiProvider because there's multiple sources of data
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryData()),
        ChangeNotifierProvider(create: (_) => MealData()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.yellowAccent,
            // Theme for text. Look at the category_item file to see how it's used.
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        title: 'DeliMeals',
        //        home: CategoriesScreen(),
        // Because routes takes a map, use curly braces since they represent a map
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
        },
      ),
    );
  }
}
