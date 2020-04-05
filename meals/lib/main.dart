import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:provider/provider.dart';

import 'models/category_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CategoryData(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            // Theme for text. Look at the category_item file to see how it's used.
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        title: 'DeliMeals',
        home: CategoriesScreen(),
      ),
    );
  }
}
