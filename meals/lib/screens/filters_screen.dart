import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  FiltersScreen({this.saveFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile _createSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  static bool _glutenFree = false;
  static bool _vegetarian = false;
  static bool _vegan = false;
  static bool _lactoseFree = false;

  List<Map<String, Object>> switchInformation = [
    {
      'title': 'Gluten-free',
      'description': 'Only include gluten-free meals',
      'currentValue': _glutenFree,
    },
    {
      'title': 'Lactose-free',
      'description': 'Only include lactose-free meals',
      'currentValue': _lactoseFree
    },
    {
      'title': 'Vegatarian',
      'description': 'Only include vegetarian meals',
      'currentValue': _vegetarian
    },
    {
      'title': 'Vegan-free',
      'description': 'Only include vegan meals',
      'currentValue': _vegan
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: widget.saveFilters,
          )
        ],
      ),
      // If you don't want the basic back arrow, add a drawer to it
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          // Have the child take up as much space as possible
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _createSwitchListTile(
                  switchInformation[index]['title'],
                  switchInformation[index]['description'],
                  switchInformation[index]['currentValue'],
                  // This is the function for onChanged:
                  // onChanged: returns a boolean parameter, which is newValue in this case
                  (newValue) {
                    setState(() {
                      switchInformation[index]['currentValue'] = newValue;
                    });
                  },
                );
              },
              itemCount: switchInformation.length,
            ),
          )
        ],
      ),
    );
  }
}
