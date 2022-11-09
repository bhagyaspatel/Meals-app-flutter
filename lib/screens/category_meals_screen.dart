import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_items.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;

  @override
  void initState() {
    //whenever state is reloaded this function will execute
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
//cant use upper line since it requires context and initState runs so early that we dont have a context at that time; so it throws error

//so we are using didChangeDependencies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //runs even before build runs
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    displayedMeal = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal?.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeal![index].id,
                title: displayedMeal![index].title,
                imageUrl: displayedMeal![index].imageUrl,
                duration: displayedMeal![index].duration,
                complexity: displayedMeal![index].complexity,
                affordability: displayedMeal![index].affordability,
                removeItem: _removeMeal);
          },
          itemCount: displayedMeal!.length,
        ));
  }
}
