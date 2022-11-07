import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_items.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  // final String categoryTitle;
  // final String categoryId;

  // CategoryMealsScreen(this.categoryId, this.categoryItem);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final filteredCategoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: filteredCategoryMeals[index].id,
                title: filteredCategoryMeals[index].title,
                imageUrl: filteredCategoryMeals[index].imageUrl,
                duration: filteredCategoryMeals[index].duration,
                complexity: filteredCategoryMeals[index].complexity,
                affordability: filteredCategoryMeals[index].affordability);
          },
          itemCount: filteredCategoryMeals.length,
        ));
  }
}
