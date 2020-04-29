
import 'package:flutter/material.dart';
import '../models/category.dart';

class MealScreen extends StatelessWidget {

  static const String id = 'MealScreen' ; 
  
  // final Category currentCategory ;
  // const MealScreen( this.currentCategory );

  
  @override
  Widget build(BuildContext context) {
    final currentCategory = ModalRoute.of(context).settings.arguments as Category ; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentCategory.color,
        title: Text( currentCategory.title),
      ),
      body: Center(
        child: Text('great >>> ')
      ),
    );
  }
}