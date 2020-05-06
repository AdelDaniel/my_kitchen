import 'package:flutter/material.dart';


import '../widgets/meal_item.dart';
import '../models/meal_model.dart';


class StarMealsScreen extends StatelessWidget {

  final List<Meal> starMeals ;
  StarMealsScreen(this.starMeals);
  
  @override
  Widget build(BuildContext context) {
    if(starMeals.isEmpty){
      return Center(child : Text('NO Stared Meals'),) ;
    }else{
    return Scaffold(
      body: GridView.builder(
        itemCount: starMeals.length,
        itemBuilder: (ctx ,index)
        {
          return MealItem(starMeals[index]);
        },
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
}