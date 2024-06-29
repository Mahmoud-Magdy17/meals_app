import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.availableCategory,
  });
  final Category availableCategory;

  Widget build(BuildContext context) {
    log(availableCategory.id);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            availableCategory.color.withOpacity(0.2),
            availableCategory.color.withOpacity(0.9),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Text(
        availableCategory.title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
