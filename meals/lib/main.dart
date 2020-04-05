import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/home_screen.dart';
import 'package:meals/screens/models/category_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CategoryData(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        title: 'DeliMeals',
        home: CategoriesScreen(),
      ),
    );
  }
}
