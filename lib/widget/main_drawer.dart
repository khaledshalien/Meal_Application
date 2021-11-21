import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/filtter_screen.dart';
import '../screens/tebs_screen.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
         Container(
           alignment: Alignment.centerLeft,
           padding: EdgeInsets.all(20),
           child: Text("Cooking Up!",style:
           TextStyle(fontSize: 30,
               color: Theme.of(context).primaryColor,
               fontWeight: FontWeight.w900),),
           height: 120,
           width: double.infinity,
           color: Theme.of(context).accentColor,
         ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text("Meal",style: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(TabsScreen.rotedNamed);
            },

          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text("Fillters",
                style:
                TextStyle(fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                )
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FillterScreen.routeNamed);
            },

          ),
        ],
      ),
    );
  }
}
