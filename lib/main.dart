import 'package:flutter/material.dart';
import 'package:meals_app/views/home_navigation_view.dart';

void main() {
  runApp(const MealsApp());
}

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(180, 60, 180, 1),
  brightness: Brightness.dark
);

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:colorScheme,
        // textTheme: TextTheme(
        //   headlineMedium: TextStyle(fontSize: 22)
        // )
      ),
      home: const HomeNavigationView(),
    );
  }
}
