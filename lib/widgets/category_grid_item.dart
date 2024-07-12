import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key, 
    required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell( // make the contents tappable with feedback effects vs GestureDetector
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container( // allows the config of background color, border, margin, padding, etc
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration( // allows the setup of a gradient
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title, 
          style: Theme.of(context).textTheme.titleLarge!.copyWith( // see the lesson about themes
            color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
      ),
    );
  }
}