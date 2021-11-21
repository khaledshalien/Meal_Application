import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widget/meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static final rotedName = "categoriesmeal";
  final List<Meal> _availableMeal;
  CategoriesMealScreen(this._availableMeal);



  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
    String? categoryTitle;
  List <Meal>? displaymeal;


  @override
  void didChangeDependencies() {
    final routeArg =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displaymeal= widget._availableMeal.where((meal){
      return meal.categories.contains(categoryId);

    }).toList();
    super.didChangeDependencies();
  }

  @override

  @override
  Widget build(BuildContext context) {


    void _removeMeal(String MealId)
    {
      setState(() {
       displaymeal!.removeWhere((meal) =>meal.id == MealId );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("${categoryTitle}"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
        return MealItem(

          imageUrl: displaymeal![index].imageUrl,
          title: displaymeal![index].title,
          duration: displaymeal![index].duration,
          complexity: displaymeal![index].complexity,
          affordability: displaymeal![index].affordability,
          id: displaymeal![index].id,
        );
        },
        itemCount:displaymeal!.length ,
      ),
    );
  }
}
