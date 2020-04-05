import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Const makes this a little bit better performance because it knows not to recreate this
      padding: const EdgeInsets.all(15),
      child: Text(title, style: Theme.of(context).textTheme.title),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
