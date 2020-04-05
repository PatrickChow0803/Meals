import 'package:flutter/material.dart';
import 'package:meals/screens/widgets/category_item.dart';
import 'package:provider/provider.dart';
import 'models/category_data.dart';
import 'widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // gridDelegate is how I want the grid to be organized
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeal'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: Provider.of<CategoryData>(context).categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              title: Provider.of<CategoryData>(context).categories[index].title,
              color: Provider.of<CategoryData>(context).categories[index].color,
            );
          }),
    );
  }
}
