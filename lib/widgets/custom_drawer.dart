import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                SizedBox(
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
            title: Text("Meals",style: Theme.of(context).textTheme.titleLarge,),
            leading: Icon(Icons.dinner_dining),
            onTap: (){},

          ),
        
          ListTile(
            title: Text("Filters",style: Theme.of(context).textTheme.titleLarge,),
            leading: Icon(Icons.settings),
            onTap: (){},

          ),
        
        ],
      ),
    );
  }
}
