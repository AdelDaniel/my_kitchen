
import 'package:flutter/material.dart';
import 'package:my_kitchen/provider/filter_provider.dart';
import 'package:provider/provider.dart';



import '../widgets/meal_item.dart';
import '../models/meal_model.dart';
import '../models/3.2 dummy_data.dart.dart';

class MealsScreen extends StatefulWidget {

  static const String id = 'MealScreen' ; 
  
   

    // final List<Meal> avalibleMeals ;
    // const MealScreen(this.avalibleMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {

    
    FilterProvider filterProvider = Provider.of<FilterProvider>(context,listen: true); 
    final Map<String , Object> currentCategory = ModalRoute.of(context).settings.arguments as Map<String , Object>  ; 
    
    
    ///from categry item >>> to get all related meals with this category and filtered 
    final categoryMeal = DUMMY_MEALS.where((meal){
      return meal.categories.contains(currentCategory['id']) && filterProvider.filtterOneMeal(meal) ; 
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