import 'package:flutter/material.dart';
import 'package:meal_application/widget/main_drawer.dart';

class FillterScreen extends StatefulWidget {
  static final routeNamed = "FiltterScreen";
  final Function savefiltters;
  final Map <String,bool> currentfilters;
  FillterScreen(this.savefiltters,this.currentfilters);


  @override
  _FillterScreenState createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {

   bool _glutenFree = false;
   bool _lactoseFree = false;
   bool _vegan = false;
   bool _vegetarian = false;
    @override

@override
    void initState() {
       _glutenFree = false;
       _lactoseFree = false;
       _vegan = false;
       _vegetarian = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Fillters"),
        actions: [
          IconButton(
              onPressed:() {
                final Map <String,bool> selectedfilters = {
                  "gluten" : _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian':_vegan,
                  'vegan':_vegetarian,
                };
                widget.savefiltters(selectedfilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),

      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your Meal selection.",style: Theme.of(context).textTheme.subtitle1,),
          ),
          Expanded(
              child:ListView(
                children: [
                  SwitchListTile(
                      title: Text("Gluten-Free"),
                      value: _glutenFree,
                      onChanged: (newvalue){
                        setState(() {
                          _glutenFree=newvalue;
                        });
                      },
                    subtitle: Text("Only include gluten-free Meals"),

                      ),
                  SwitchListTile(
                    title: Text("Locatose-Free"),
                    value: _lactoseFree,
                    onChanged: (newvalue){
                      setState(() {
                        _lactoseFree=newvalue;
                      });
                    },
                    subtitle: Text("Only include Locatose-free Meals"),

                  ),
                  SwitchListTile(
                    title: Text("Vegan-Free"),
                    value: _vegan,
                    onChanged: (newvalue){
                      setState(() {
                        _vegan=newvalue;
                      });
                    },
                    subtitle: Text("Only include Vegan-free Meals"),

                  ),
                  SwitchListTile(
                    title: Text("Vegetarian-Free"),
                    value: _vegetarian,
                    onChanged: (newvalue){
                      setState(() {
                        _vegetarian=newvalue;
                      });
                    },
                    subtitle: Text("Only include Vegetarian -free Meals"),

                  ),
                ],
              )
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}




