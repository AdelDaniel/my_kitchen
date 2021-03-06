import 'package:flutter/material.dart';


import '../widgets/meal_item.dart';
import '../models/meal_model.dart';


///PROVIDRRS 
import 'package:provider/provider.dart';
import '../provider/star_provider.dart';
import '../provider/filter_provider.dart';

class StarMealsScreen extends StatelessWidget {

  // final List<Meal> starMeals ;
  // StarMealsScreen(this.starMeals);
  
  @override
  Widget build(BuildContext context) {

    FilterProvider filterProvider = Provider.of<FilterProvider>(context,listen: true); 
    final StarMeals starMealsProvider = Provider.of<StarMeals>(context);
    
    ///get star meals and filter it   
    final List<Meal> starMeals =starMealsProvider.getStarMeals.where((meal){
      return filterProvider.filtterOneMeal(meal);
    }).toList();

    if(starMeals.isEmpty){
      return Center(child : Text('NO Stared Meals'),) ;
    }else{
    return Scaffold(
      body: GridView.builder(
        itemCount: starMeals.length,
        itemBuilder: (ctx ,index)
        {
          return MealItem(starMeals[index]) ;
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