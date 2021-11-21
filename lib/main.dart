import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/categories_meal_screen.dart';
import './screens/categories_screen.dart';
import './screens/filtter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tebs_screen.dart';

import 'models/meal.dart';

void main()=> runApp( MyApp());


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeal=DUMMY_MEALS;
  List<Meal> _favoriteeMeal=[];
  Map <String,bool> _filters={
    "gluten" : false,
    'lactose': false,
    'vegetarian':false,
    'vegan':false,
  };


  void _toggleFavorite(String mealId){
    final existingIndex=  _favoriteeMeal.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0 )
    {
      setState(() {
        _favoriteeMeal.removeAt(existingIndex);
      });
    }
    else
      {
        setState(() {
          _favoriteeMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
  }
  void _setFiltters(Map <String,bool> _filterdata){
    setState(() {
      _filters=_filterdata;
      _availableMeal = DUMMY_MEALS.where((Meal){
        if(_filters['gluten']== true && Meal.isGlutenFree==false){
          return false;
        };
        if(_filters['lactose']== true && Meal.isLactoseFree==false){
          return false;
        };
        if(_filters['vegetarian']== true && Meal.isVegetarian==false){
          return false;
        };
        if(_filters['vegan']== true && Meal.isVegan==false){
          return false;
        };

        return true;

      }).toList();
    });

  }
  bool _ismeFavorite(String id){
    return _favoriteeMeal.any((meal) => meal.id == id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1:TextStyle(color: Color.fromRGBO(20, 50, 50, 1)) ,
          body2:TextStyle(color: Color.fromRGBO(20, 50, 50, 1)) ,
          title:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          ),
        ),
      ),


      initialRoute: TabsScreen.rotedNamed,
      routes: {
        TabsScreen.rotedNamed:(context)=>TabsScreen(_favoriteeMeal),
        CategoriesMealScreen.rotedName:(context)=>CategoriesMealScreen(_availableMeal),
        MealDetailsScreen.RoutedName:(context)=>MealDetailsScreen(_toggleFavorite,_ismeFavorite),
        FillterScreen.routeNamed:(context)=>FillterScreen(_setFiltters,_filters),
      },

      home: CategoriesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
