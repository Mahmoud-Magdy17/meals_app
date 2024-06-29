import 'package:flutter/material.dart';
import 'package:meals_app/views/home_navigation_view.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key});
  // final Map<Filter,bool>filters;
  @override
  State<FiltersView> createState() => _FiltersViewState();
}

enum Filter {
  isGlutenFree,
  isVegan,
  isVegetarian,
  isLactoseFree,
}

class _FiltersViewState extends State<FiltersView> {
  final Map<Filter, bool> _filters = {
    Filter.isVegetarian: false,
    Filter.isGlutenFree: false,
    Filter.isLactoseFree: false,
    Filter.isVegan: false,
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _filters = widget.filters;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bo) {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Filters Screen"),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(_filters);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Column(
          children: [
            switchFilter(
              filter: Filter.isVegetarian,
              title: 'Vegetarian',
              subTitle: "only Include Vegetarian meals",
              onChanged: (bool newValue) => setState(() {
                _filters[Filter.isVegetarian] = newValue;
              }),
            ),
            switchFilter(
              filter: Filter.isGlutenFree,
              title: 'GlutenFree',
              subTitle: "only Include GlutenFree meals",
              onChanged: (bool newValue) => setState(() {
                _filters[Filter.isGlutenFree] = newValue;
              }),
            ),
            switchFilter(
              filter: Filter.isLactoseFree,
              title: 'LactoseFree',
              subTitle: "only Include LactoseFree meals",
              onChanged: (bool newValue) => setState(() {
                _filters[Filter.isLactoseFree] = newValue;
              }),
            ),
            switchFilter(
              filter: Filter.isVegan,
              title: 'Vegan',
              subTitle: "only Include Vegan meals",
              onChanged: (bool newValue) => setState(() {
                _filters[Filter.isVegan] = newValue;
              }),
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile switchFilter(
      {required Filter filter,
      required String title,
      required String subTitle,
      required Function(bool newValue) onChanged}) {
    return SwitchListTile(
      value: _filters[filter]!,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
