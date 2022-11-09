import 'package:flutter/material.dart';
import 'package:meals_app/screens/filtered_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext context, String title, IconData icon, Function onClick) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(context).primaryColor),
        ),
        onTap: () {
          onClick();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //so that we dont push the new screen into the stack
          }),
          buildListTile(context, 'Settings', Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(FilteredScreen.routeName);
          }),
        ],
      ),
    );
  }
}
