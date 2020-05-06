
import 'package:flutter/material.dart';


import '../screens/filtter_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


    ListTile buildListTile(IconData icon ,String text , Function onTap) {
    return ListTile( 
        leading: Icon(icon, size: 25, ),
        title: Text( text , style: TextStyle(fontSize: 25 ,fontFamily: 'RobotoCondensed' ),),
        onTap: onTap,
        trailing: Icon(Icons.arrow_forward),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      semanticLabel: "I Don't Konw ",
      child: SafeArea(
              child: Column(
          children : <Widget>[
          Container(
            alignment: Alignment.centerLeft,

            child: Text('My Kitchen' , style: Theme.of(context).textTheme.title.copyWith(fontFamily: 'Raleway' ,fontSize: 40),),
          ),
          Divider(),

          buildListTile(Icons.restaurant ,'Meals Category', (){
            Navigator.of(context).pushReplacementNamed('/');

          }),
          buildListTile( Icons.settings , 'Filtter' ,(){
            Navigator.of(context).pushNamed(FiltterScreen.route) ;

          }),
          
          ]),
      ),
      
    );
  }

}