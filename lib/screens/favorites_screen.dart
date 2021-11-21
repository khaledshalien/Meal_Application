import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteeMeal;

  FavoritesScreen(this.favoriteeMeal);


  @override
  Widget build(BuildContext context) {
    if (favoriteeMeal.isEmpty) {
      return Center(
        child: Text("you have no favorites yet - start adding some!"),
      );
    }

    else {
        return ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
              imageUrl: favoriteeMeal[index].imageUrl,
              title: favoriteeMeal[index].title,
              duration: favoriteeMeal[index].duration,
              complexity: favoriteeMeal[index].complexity,
              affordability: favoriteeMeal[index].affordability,
              id: favoriteeMeal[index].id,
            );
          },
          itemCount:favoriteeMeal.length ,
        );

    }
  }
}