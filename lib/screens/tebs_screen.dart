import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widget/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  static final rotedNamed = "TabsScreen";
  final List<Meal> favoriteeMeal;
  TabsScreen(this.favoriteeMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   late List _Pages;


  initState(){
    _Pages=[
      {
        'Page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'Page': FavoritesScreen(widget.favoriteeMeal),
        'title':'Your Favorites',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _Selectpage(int value){
   setState(() {
     _selectedPageIndex = value;
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_Pages[_selectedPageIndex]['title'])),
      body: _Pages[_selectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _Selectpage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites"),
        ],
      ),
      drawer: MainDrawer(
      ),
    );
  }
}
