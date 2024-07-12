import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(title: 'Some title...', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // good stating point for app with many screens, useful to add a title and a body content
      appBar: AppBar(
        // app bar is a header that is displayed at the top of the screen
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25), // space around the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // layout of the grid
          crossAxisCount: 2, // number of columns
          childAspectRatio: 3 / 2, // aspect ratio of each grid item
          crossAxisSpacing: 20, // space between columns
          mainAxisSpacing: 20, // space between rows
        ),
        children: [
          for (final category
              in availableCategories) // loop through the available categories
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context);
                }),
        ],
        // an alternative is to use the map method
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
      ),
    );
  }
}
