import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class BodyMealCardItem extends StatelessWidget {
  const BodyMealCardItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(
          right: 0,
          bottom: 48,
          width: 180,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 8,
            ),
            decoration: const BoxDecoration(color: Colors.black54),
            child: Text(
              meal.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                    // color: Colors.amber
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
