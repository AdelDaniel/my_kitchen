import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/filtter_screen.dart';
import '../provider/filter_provider.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  ListTile buildListTile(IconData icon, String text, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 25, fontFamily: 'RobotoCondensed'),
      ),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> _selections = FilterProvider.selections;
    Widget seclectingWidget(String selecting) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          onTap: () {
            setState(() {
              //   print('cupertino preesed' + _selections[selecting].toString());
              _selections[selecting] = (!_selections[selecting]);
            });
          },
          child: ListTile(
            title: Text(
              selecting,
              style: TextStyle(color: Colors.black),
            ),
            trailing: CupertinoSwitch(
              value: _selections[selecting],
              onChanged: (bool value) {
                setState(() {
                  ///   print('cupertino preesed' + value.toString() + _selections[selecting].toString());
                  _selections[selecting] = !_selections[selecting];
                });
              },
            ),
          ),
        ),
      );
    }

    Widget _buildExpandableList() {
      return SingleChildScrollView(
        child: Card(
          elevation: 2.0,
          child: ExpansionTile(
            leading: Icon(
              Icons.filter_list,
              size: 25,
            ),
            title: const Text(
              'Filter',
              style: TextStyle(fontSize: 25, fontFamily: 'RobotoCondensed'),
            ),
            children: <Widget>[
              Text(
                'Choose Type of Meals',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              seclectingWidget(FilterProvider.glutenFree),
              seclectingWidget(FilterProvider.vegetarian),
              seclectingWidget(FilterProvider.vegan),
              seclectingWidget(FilterProvider.lactoseFree),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 31,
                  width: 95,
                  child: FloatingActionButton.extended(
                    onPressed: () {

                      Provider.of<FilterProvider>(context, listen: false)
                          .setSelections(_selections);
                          Navigator.pop(context);
                    },
                    label: Text('Save'),
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.save),
                    heroTag: "Save",
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Drawer(
      elevation: 10,
      semanticLabel: "I Don't Konw ",
      child: SafeArea(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Kitchen',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontFamily: 'Raleway', fontSize: 40),
            ),
          ),
          Divider(),
          buildListTile(Icons.restaurant, 'Meals Category', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Settings', () {
            Navigator.of(context).pushNamed(FiltterScreen.route);
          }),
          _buildExpandableList(),
        ]),
      ),
    );
  }
}
