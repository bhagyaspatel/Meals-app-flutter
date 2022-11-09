import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/favourite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

//In DefaultTapBar we dont have to listen to the tab toggling change, it is in-built
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favourites',
//               ),
//             ]),
//           ),
//           body: TabBarView(
//             children: <Widget>[CategoriesScreen(), FavouriteScreen()],
//           ),
//         ));
//   }
// }

//In BottomNavigationBar we have to listen to the tab toggling change, it is in-built
class _TabsScreenState extends State<TabsScreen> {
  // final List<Widget> _pages = [CategoriesScreen(), FavouriteScreen()];
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Your Favourite'},
  ];

  int _selectedPageIndex = 0;

  //flutter will automatically call this function when diff tab is selected
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Categories')
        ],
      ),
    );
  }
}
