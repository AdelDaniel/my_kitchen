import 'package:flutter/material.dart';




import '../screens/meal_screen.dart';
import '../models/category.dart';


class CategoryItem extends StatelessWidget {

final Category cat ;
  const CategoryItem({
    @required this.cat,
  });


  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealScreen.id , arguments: cat ,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: InkWell(
     onTap: () {
        selectCategory(context); 
    } ,
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.yellow,
            child: Text(
      cat.title,
      style: Theme.of(context).textTheme.title,
    ),
        ),
        decoration: BoxDecoration(
    gradient: LinearGradient(
      // colors: [Colors.black  , color ] ,
      colors: [cat.color.withOpacity(0.3)  , cat.color ] ,
      begin: Alignment.bottomRight,
      end:   Alignment.topLeft ,
      tileMode: TileMode.mirror,
      
      stops: [0.1,0.6]
    ),
    borderRadius:  BorderRadius.circular(15),

   ),
        
      );
  }
}