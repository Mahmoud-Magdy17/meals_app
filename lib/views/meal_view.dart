import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealView extends StatelessWidget {
  const MealView({super.key, required this.meal, required this.addToFavorite});
  final Meal meal;
  final Function(Meal) addToFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
            onPressed: (){
              addToFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
