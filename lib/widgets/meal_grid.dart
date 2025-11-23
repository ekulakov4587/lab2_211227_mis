import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../screens/meal_detail_page.dart';

class MealGrid extends StatelessWidget {
  final List<Meal> meals;
  const MealGrid({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 200/244,
      ),
      itemBuilder: (context, index) {
        final meal = meals[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MealDetailPage(mealId: meal.id),
              )),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.orange.shade300, width: 2),
            ),
            child: Column(
              children: [
                Expanded(child: Image.network(meal.thumb, fit: BoxFit.cover)),
                const Divider(),
                Text(meal.name, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}
