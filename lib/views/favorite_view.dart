import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_list_builder.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({
    super.key,
    required this.favorites, required this.addToFavorite,
  });
  final Function(Meal) addToFavorite;
  final List<Meal> favorites;
  @override
  Widget build(BuildContext context) {
    return MealsListBuilder(meals: favorites, addToFavorite: addToFavorite);
  }
}
