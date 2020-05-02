
import 'package:flutter/material.dart';

import '../models/3.2%20dummy_data.dart.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatelessWidget {

  static const String id = 'MealScreen' ; 
  
  // final Category currentCategory ;
  // const MealScreen( this.currentCategory );

  
  @override
  Widget build(BuildContext context) {
    final currentCategory = ModalRoute.of(context).settings.arguments as Category ; 
    final categoryMeal = DUMMY_MEALS.where((meal){
      return meal.categories.contains(currentCategory.id)  ; 
    }).toList();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentCategory.color,
        title: Text( currentCategory.title),
      ),
      body: GridView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (ctx ,index)
        {
          return MealItem(categoryMeal[index]);
        } ,
       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400 ,
          childAspectRatio: 2/1 ,
          crossAxisSpacing: 2,
          mainAxisSpacing: 25 ,
      ),
      ),
    );
  }
}