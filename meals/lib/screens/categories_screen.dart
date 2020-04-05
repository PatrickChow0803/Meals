import 'package:flutter/material.dart';
import 'package:meals/models/category_data.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // gridDelegate is how I want the grid to be organized
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView.builder(
          // Adds spacing between all the widgets.
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // The maximum amount of length that a widget should take.
            maxCrossAxisExtent: 200,
            // Aspect Ratio between width and the height
            childAspectRatio: 3 / 2,
            // The amount of spacing in the middle
            crossAxisSpacing: 20,
            // The amount of spacing top/bot
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
