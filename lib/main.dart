


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/star_provider.dart';
import './provider/filter_provider.dart';
import './screens/filtter_screen.dart';
import './screens/main_tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
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
          '/' :  (context) => MainTabsScreen() ,
          CategoryScreen.id : (context) => CategoryScreen() ,
          MealsScreen.id : (context) => MealsScreen() ,
          MealDetail.id : (context) => MealDetail() ,
          FiltterScreen.route :(context) => FiltterScreen() , 
        },
      ),
    );
  }
}
