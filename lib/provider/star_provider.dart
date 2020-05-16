import 'package:flutter/cupertino.dart';
import '../models/3.2%20dummy_data.dart.dart';


import '../models/meal_model.dart';


class StarMeals with ChangeNotifier{
  List<Meal> _starMeals = [] ;

  List<Meal> get getStarMeals{
    return [..._starMeals] ; 
  }


    void addOrRemoveStar(String staredMealId){
      ///returns -1 if element not found in starmeal -1 >>> then add meal to star 
    final int currentMealIndex = _starMeals.indexWhere((meal) { return meal.id == staredMealId;});
    print(currentMealIndex);
    if(currentMealIndex >=0 )
    {
      _starMeals.removeAt(currentMealIndex);
    }else {
      _starMeals.add(DUMMY_MEALS.firstWhere((meal)=> meal.id == staredMealId));  
    }
    notifyListeners();
  }

  bool checkStaredMeal(String id){
    return _starMeals.any((meal) { return meal.id == id;});
  }
}