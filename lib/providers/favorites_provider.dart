import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMEalFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    // since in Providers we cannot modify the state directly,
    // we need to create a new list each time we want to add or remove a meal
    if (mealIsFavorite) {
      // create a list without the meal that we want to remove
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // create a new list with the meal that we want to add
      // using the spread operator '...' to copy the existing list
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
