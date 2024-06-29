import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/meal_view.dart';
import 'package:meals_app/widgets/body_meal_card.dart';
import 'package:meals_app/widgets/buttom_meals_card_itme.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({
    super.key,
    required this.meal,
    required this.addToFavorite,
  });
  final Meal meal;
  final Function(Meal) addToFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MealView(
                meal: meal,
                addToFavorite: addToFavorite,
              );
            },
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            BodyMealCardItem(meal: meal),
            SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtomMealsCardItem(
                      text: "${meal.duration}", icon: Icons.schedule),
                  ButtomMealsCardItem(
                      text: meal.complexity.name.toString(), icon: Icons.work),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
