import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class FilteredScreen extends StatefulWidget {
  static const routeName = '/filtered-Screen';

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
//If we want to control the whole screen we need to use the Sccafold() as parent

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTiles(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            )),
        Expanded(
            child: ListView(
          children: <Widget>[
            _buildSwitchTiles(
                'Gluten-Free', 'Only include Gluten free meals', _glutenFree,
                (newValue) {
              setState(
                () {
                  _glutenFree = newValue;
                },
              );
            }),
            _buildSwitchTiles(
                'Lactose-free', 'Only include lactose free meals', _lactoseFree,
                (newValue) {
              setState(
                () {
                  _lactoseFree = newValue;
                },
              );
            }),
            _buildSwitchTiles(
                'Vegetarian', 'Only include Vegetarian food', _vegetarian,
                (newValue) {
              setState(
                () {
                  _vegetarian = newValue;
                },
              );
            }),
            _buildSwitchTiles('Vegan', 'Only include Vegan food meals', _vegan,
                (newValue) {
              setState(
                () {
                  _vegan = newValue;
                },
              );
            }),
          ],
        ))
      ]),
    );
  }
}
