
import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';

import 'package:meal_application/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(25),
        children:
        [
          ...DUMMY_CATEGORIES.map((Catdata)=>
          CategoryItem(Catdata.id, Catdata.title, Catdata.color)
          ).toList(),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
         childAspectRatio: 3/2,
         mainAxisSpacing: 20,
         crossAxisSpacing: 20,
         maxCrossAxisExtent: 200,
        ),


      ),

    );
  }
}
