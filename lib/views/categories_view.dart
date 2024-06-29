import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/category_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.addToFavorite});
  final Function(Meal) addToFavorite;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          log("s");
          final _currentCategoryMeals = dummyMeals
              .where(
                (meal) => meal.categories.contains(
                  availableCategories[index].id,
                ),
              )
              .toList();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MealsView(meals: _currentCategoryMeals, addToFavorite: addToFavorite,),
            ),
          );
        },
        child: CategoryCard(
          availableCategory: availableCategories[index],
        ),
      ),
    );
  }
}
