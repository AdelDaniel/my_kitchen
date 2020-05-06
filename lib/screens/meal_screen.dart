
import 'package:flutter/material.dart';



import '../widgets/meal_item.dart';
import '../models/meal_model.dart';

class MealScreen extends StatefulWidget {

  static const String id = 'MealScreen' ; 
  
   

    final List<Meal> avalibleMeals ;
    const MealScreen(this.avalibleMeals);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String , Object> currentCategory = ModalRoute.of(context).settings.arguments as Map<String , Object>  ; 
    final categoryMeal = widget.avalibleMeals.where((meal){
      return meal.categories.contains(currentCategory['id'])  ; 
    }).toList();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentCategory['color'],
        title: Text( currentCategory['title']),
      ),
      body: GridView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (ctx ,index)
        {
          return MealItem(categoryMeal[index]);
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