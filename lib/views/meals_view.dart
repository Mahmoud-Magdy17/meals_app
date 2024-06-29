import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_card.dart';
import 'package:meals_app/widgets/meals_list_builder.dart';

class MealsView extends StatelessWidget {
  const MealsView({
    super.key,
    required this.meals,
    required this.addToFavorite,
    required this.filteredMeals,
  });
  final List<Meal> meals;
  final List<Meal> filteredMeals;
  final Function(Meal) addToFavorite;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
        ),
        body: MealsListBuilder(
          meals: filteredMeals,
          addToFavorite: addToFavorite,
        ),
      ),
    );
  }
}
