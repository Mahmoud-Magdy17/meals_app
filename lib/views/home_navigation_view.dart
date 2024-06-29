import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/categories_view.dart';
import 'package:meals_app/views/favorite_view.dart';
import 'package:meals_app/widgets/custom_drawer.dart';
import 'package:meals_app/widgets/meals_card.dart';

class HomeNavigationView extends StatefulWidget {
  const HomeNavigationView({super.key});

  @override
  State<HomeNavigationView> createState() => _HomeNavigationViewState();
}

class _HomeNavigationViewState extends State<HomeNavigationView> {
  int curView = 0;
  List<Meal> favorites = [];
  addToFavorite(Meal newFavorite) {
    setState(() {
      if(favorites.contains(newFavorite)){
        favorites.remove(newFavorite);
      }else{
        favorites.add(newFavorite);
      }
    });
    log(favorites.toString());
  }

  void swichPage(index) {
    if (index != curView) {
      setState(() {
        curView = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text("meals app"),
      ),
      body: curView == 0
          ? CategoriesView(addToFavorite: addToFavorite)
          : FavoriteView(favorites: favorites,addToFavorite: addToFavorite),
      bottomNavigationBar: BottomNavigationBar(
        onTap: swichPage,
        currentIndex: curView,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_rounded),
            label: "",
          ),
        ],
      ),
    );
  }
}
