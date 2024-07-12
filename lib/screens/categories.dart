import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =  dummyMeals
      .where((meal) => meal.categories.contains(category.id)) 
      // the body of the function is executed for each element in the list
      // and must return true if we want to include the element in the new list
      .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, 
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
                  _selectCategory(context, category);
                }),
        ],
        // an alternative is to use the map method
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
    );
  }
}
