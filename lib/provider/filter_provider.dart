
import 'package:flutter/cupertino.dart';

import '../models/meal_model.dart';

class FilterProvider with ChangeNotifier{


///Model ///////////////
  static const String glutenFree = 'Gluten Free';
  static const String vegetarian = 'Vegetarian';
  static const String vegan = 'Vegan';
  static const String lactoseFree = 'Lactose Free';

  static Map<String,bool> selections={
    glutenFree : false,
    vegetarian : false,
    vegan : false,
    lactoseFree: false, 
  };
/// END Model //////////


/// provider /////////////////
  Map<String,bool> _selections=selections ;
  
  Map<String,bool> get getSelections{
    print({..._selections});
    return {..._selections};
  }

  
  void setSelections(Map<String,bool> filtterData){
    // print({..._selections});
       _selections = filtterData;
       notifyListeners();

       _selections.forEach((k , v){
         print( ' ${_selections[k]} foreach ' );
       });
  }

/// get the meals from anywhere that need to filterd depending on selections
    List<Meal> filtterMeals(List<Meal> _availableMeals ){

     return _availableMeals.where((meal) {
        if (_selections[glutenFree] && !meal.isGlutenFree) {
          return false;
        }
        if (_selections[lactoseFree] && !meal.isLactoseFree) {
          return false;
        }
        if (_selections[vegan] && !meal.isVegan) {
          return false;
        }
        if (_selections[vegetarian] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    }


/// do the same as above but only in one meal 
    bool filtterOneMeal(Meal currentMeal ){
        if (_selections[glutenFree] && !currentMeal.isGlutenFree) {
          return false;
        }
        if (_selections[lactoseFree] && !currentMeal.isLactoseFree) {
          return false;
        }
        if (_selections[vegan] && !currentMeal.isVegan) {
          return false;
        }
        if (_selections[vegetarian] && !currentMeal.isVegetarian) {
          return false;
        }
        return true;
    }
}



