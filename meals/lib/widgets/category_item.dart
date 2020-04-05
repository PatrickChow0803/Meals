import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    // InkWell is similar to GestureDetector but has special effects. Such as the ripple effect from splashColor.
    return InkWell(
      // IMPORTANT***: context is the widget that the user selected
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      // borderRadius should be the same borderRadius as it's child.
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        // Const makes this a little bit better performance because it knows not to recreate this
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            // From opacity .7 starting from the topleft, move to 1 ending at bottom right
            color.withOpacity(.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
