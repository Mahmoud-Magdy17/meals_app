import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_card.dart';

class MealsListBuilder extends StatelessWidget {
  const MealsListBuilder({
    super.key,
    required this.meals,
    required this.addToFavorite,
  });
  final List<Meal> meals;
  final Function(Meal) addToFavorite;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealsCard(
          meal: meals[index],
          addToFavorite: addToFavorite,
        );
      },
    );
  }
}
