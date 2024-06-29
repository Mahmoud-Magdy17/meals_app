import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/views/filters_view.dart';
import 'package:meals_app/views/home_navigation_view.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.selectPage});
  final Function(String page) selectPage;
  var filters = kInitialFilters;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              colorScheme.onSecondaryContainer.withOpacity(0.4),
              colorScheme.onSecondaryContainer.withOpacity(0.9),
            ])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: colorScheme.onSecondary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Cooking Up...",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: const Icon(Icons.dinner_dining),
            onTap: (){
              selectPage("Meals");
            },
          ),
          ListTile(
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: const Icon(Icons.settings),
            onTap: () {
              selectPage("Filters");
            },
          ),
        ],
      ),
    );
  }
}
