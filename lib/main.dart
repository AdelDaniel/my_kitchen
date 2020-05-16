


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/star_provider.dart';
import './provider/filter_provider.dart';
import './models/meal_model.dart';
import './models/3.2%20dummy_data.dart.dart';
import './screens/filtter_screen.dart';
import './screens/main_tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



// List<Meal> _availableMeals = DUMMY_MEALS ;
// List<Meal> starMeals = [] ;


  // IconData _addOrRemoveStar(String staredMealId ,bool checkIconOnly ){
  //   final int currentMealIndex = starMeals.indexWhere((meal) { return meal.id == staredMealId;});
  //   print(currentMealIndex);
  //   if(currentMealIndex >=0 )
  //   {
  //     if(checkIconOnly) return Icons.star; 
  //     setState(() {
  //     starMeals.removeAt(currentMealIndex);
  //     });
  //     return Icons.star_border ;
  //   }else {
  //       if(checkIconOnly) return Icons.star_border ;
  //       setState(() {
  //       starMeals.add(DUMMY_MEALS.firstWhere((meal)=> meal.id == staredMealId));
  //       });
  //     return Icons.star ;  
  //   }
  //  }

  // static const String _glutenFree = 'Gluten Free';
  // static const String _vegetarian = 'Vegetarian';
  // static const String _vegan = 'Vegan';
  // static const String _lactoseFree = 'Lactose Free';

  // Map<String,bool> _selections={
  //   _glutenFree : false,
  //   _vegetarian : false,
  //   _vegan : false,
  //   _lactoseFree: false, 
  // };
  
  // void _setFiltters(Map<String,bool> filtterData){
  //   //filtteredMeals.clear();
  //       setState(() {
  //     _selections = filtterData;

  //     _availableMeals = DUMMY_MEALS.where((meal) {
  //       if (_selections[_glutenFree] && !meal.isGlutenFree) {
  //         return false;
  //       }
  //       if (_selections[_lactoseFree] && !meal.isLactoseFree) {
  //         return false;
  //       }
  //       if (_selections[_vegan] && !meal.isVegan) {
  //         return false;
  //       }
  //       if (_selections[_vegetarian] && !meal.isVegetarian) {
  //         return false;
  //       }
  //       return true;
  //     }).toList();
  //   });

  //   print( ' ${_selections[_lactoseFree]} aad' );
  //   print( ' ${_selections[_vegan]} aad' );
  //   print( ' ${_selections[_lactoseFree]} aad' );
  //   print( ' ${_selections[_lactoseFree]} aad' );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
        value :StarMeals(),),

        ChangeNotifierProvider.value(
        value :FilterProvider(),),
      ],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Colors.white,
          //canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
      
       // home: TabsScreen() ,
        initialRoute: '/',
        routes: {
          '/' :  (context) => MainTabsScreen() ,// (context) => MainTabsScreen(starMeals) ,
          CategoryScreen.id : (context) => CategoryScreen() ,
          MealsScreen.id : (context) => MealsScreen() , // MealScreen(_availableMeals) ,
          MealDetail.id : (context) => MealDetail() , //MealDetail(_addOrRemoveStar) ,
          FiltterScreen.route :(context) => FiltterScreen() , // FiltterScreen(_setFiltters) ,
        },
      ),
    );
  }
}
