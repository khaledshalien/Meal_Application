import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';

 class MealDetailsScreen extends StatefulWidget {
  static final RoutedName = "Mealdetailscreen";
  final Function togglefavorite;
  final Function isfavorite;

  MealDetailsScreen(this.togglefavorite,this.isfavorite);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedmeal.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedmeal.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("Ingredients", style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
               border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                  itemBuilder: (ctx,index){
                    return Card(
                      
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: Text(selectedmeal.ingredients[index]),
                      )
                    );
                  },
                   itemCount:selectedmeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("Steps", style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1,),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx,index){
                  return Column(
                    children: [
                  ListTile(
                  leading: CircleAvatar(
                  child: Text("# ${index + 1}"),
                  ),
                  title: Text(selectedmeal.steps[index]),
                  ),
                      Divider(),
                    ],
                  );
                },
                itemCount:selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>widget.togglefavorite(MealId),
        child: Icon(

            widget.isfavorite(MealId)?Icons.star:Icons.star_border
        ),
      ),
    );
  }
}
