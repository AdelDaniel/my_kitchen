
import 'package:flutter/material.dart';


import '../screens/meal_detail_screen.dart';
import '../models/meal_model.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  void selectedMeal(ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetail.id , arguments: meal.id ,
    );
  }

  String get getComplexity {
    if (meal.complexity == Complexity.Simple)
      return 'Simple';
    else if (meal.complexity == Complexity.Hard)
      return 'Hard';
    else if (meal.complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return 'know by yourself';
  }

  String get getAffordability {
    if (meal.affordability == Affordability.Affordable)
      return 'Affordable';
    else if (meal.affordability == Affordability.Luxurious)
      return 'Luxurious';
    else if (meal.affordability == Affordability.Pricey)
      return 'Pricey';
    else
      return 'know by yourself';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () => selectedMeal(context),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.all(10),
        child: Container(
          child: Stack(
            children: <Widget>[


              // image Of Meal 
              Positioned.fill(
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'assets/images/Suggestions+for+the+Best+Italian+Dishes+Kids.png',
                      ),
                    ),
                  ),
                ),
              ),


              // meal title 
              Positioned(
                bottom: 30,
                //height: 80 ,
                right: 0,

                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12.withOpacity(0)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  )),
                  child: FittedBox(
                    child: Text(
                      meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),


              // meal basic info [time and complexity and affordability ]
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.schedule),
                            Text(': ${meal.duration} min')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.work),
                            Text(': $getComplexity')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            Text(': $getAffordability ')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
