import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import '../models/meal.dart';
import 'categories_view.dart';
import 'favorite_view.dart';
import '../widgets/custom_drawer.dart';
import 'filters_view.dart';

const kInitialFilters = {
  Filter.isGlutenFree: false,
  Filter.isLactoseFree: false,
  Filter.isVegan: false,
  Filter.isVegetarian: false,
};

class HomeNavigationView extends StatefulWidget {
  const HomeNavigationView({super.key});

  @override
  State<HomeNavigationView> createState() => _HomeNavigationViewState();
}

class _HomeNavigationViewState extends State<HomeNavigationView> {
  int curView = 0;
  List<Meal> favorites = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  addToFavorite(Meal newFavorite) {
    setState(() {
      if (favorites.contains(newFavorite)) {
        favorites.remove(newFavorite);
      } else {
        favorites.add(newFavorite);
      }
    });
    log(favorites.toString());
  }

  void selectScreen(String page) {
    Navigator.pop(context);
    if (page == "Meals") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeNavigationView();
          },
        ),
      );
    } else if (page == "Filters") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return const FiltersView();
          }),
        ),
      ).then((newFilter) {
        setState(() {
          _selectedFilters=newFilter??kInitialFilters;
        });
      });
    }
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
    log(_selectedFilters.values.toString());
    var _filteredMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.isGlutenFree]! && !meal.isGlutenFree){
        log("${_selectedFilters[Filter.isGlutenFree]}");
        return false;
      }
      if(_selectedFilters[Filter.isLactoseFree]! && !meal.isLactoseFree){
        log("${_selectedFilters[Filter.isLactoseFree]}");
        return false;
      }
      if(_selectedFilters[Filter.isVegan]! && !meal.isVegan){
        log("${_selectedFilters[Filter.isVegan]}");
        return false;
      }
      if(_selectedFilters[Filter.isVegetarian]! && !meal.isVegetarian){
        log("${_selectedFilters[Filter.isVegetarian]}");
        return false;
      }
      return true;
    }).toList(); 
    return Scaffold(
      drawer: CustomDrawer(
        selectPage: selectScreen,
      ),
      appBar: AppBar(
        title: const Text("meals app"),
      ),
      body: curView == 0
          ? CategoriesView(addToFavorite: addToFavorite, filteredMeals:_filteredMeals )
          : FavoriteView(favorites: favorites, addToFavorite: addToFavorite),
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
