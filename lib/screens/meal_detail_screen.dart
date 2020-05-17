import 'package:flutter/material.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/services.dart';

import '../models/3.2 dummy_data.dart.dart';
import '../models/meal_model.dart';

/// provider >>
import 'package:provider/provider.dart';
import '../provider/star_provider.dart';

class MealDetail extends StatelessWidget {
  static const String id = "/MealDetail";

//   // final Function _addOrRemoveStar;
//   // MealDetail(this._addOrRemoveStar);

//   @override
//   _MealDetailState createState() => _MealDetailState();
// }

// class _MealDetailState extends State<MealDetail> {

  @override
  Widget build(BuildContext context) {
       Meal currentMeal;
       int i = 1;
    final md = MediaQuery.of(context).size;
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    currentMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id.contains(mealId);
    });

      List<Widget> _buildFloatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "Copy Meal",
        child: Icon(Icons.content_copy),
        tooltip: 'Copy code link to clipboard',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: '''${currentMeal.title} ,
            \n\n  Ingredients \n ${currentMeal.ingredients} 
            \n\n  Steps \n    ${currentMeal.steps} '''));

          // Scaffold.of(context).showSnackBar(SnackBar(
          // content: Text('Meal copied to Clipboard!'), ));
        },
      ),
      Consumer<StarMeals>(
        builder: (_, starMeal, child) => FloatingActionButton(
          heroTag: "Star",
          child: Icon(starMeal.checkStaredMeal(currentMeal.id)
              ? Icons.star
              : Icons.star_border),
          tooltip: 'Star',
          onPressed: () {
            starMeal.addOrRemoveStar(currentMeal.id);
          },
        ),
      ),
    ];
  }

    
    return Scaffold(
      body: Container(
        height: md.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: currentMeal.imageUrl != null
              ? NetworkImage(
                  currentMeal.imageUrl,
                )
              : AssetImage(
                  'assets/images/Suggestions+for+the+Best+Italian+Dishes+Kids.png',
                ),
        )),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Container(
                height: md.height * 25 / 100,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    //color: Colors.green,
                    //border: Border.all(width: 10),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: currentMeal.imageUrl != null
                          ? NetworkImage(
                              currentMeal.imageUrl,
                            )
                          : AssetImage(
                              'assets/images/Suggestions+for+the+Best+Italian+Dishes+Kids.png',
                            ),
                    )),
              ),
            ),

            /// Name Of The Meal /////////////////////////////////////////////////////////
            Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: md.height * 0.20,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(currentMeal.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontSize: 20)),
                          ),
                        )
                      ],
                    )
                  ],
                )),

            /////////////////////////// Ingradients  ////////////////////////////////////////

            //crossAxisAlignment: CrossAxisAlignment.values = [CrossAxisAlignment.start , CrossAxisAlignment.end ,],

            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80)),
                child: Container(
                  margin: EdgeInsets.only(
                    top: md.height * 0.28,
                  ),
                  alignment: Alignment.centerRight,
                  width: 200,
                  height: 205,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 1,
                    //       color: Colors.black,
                    //       offset: Offset(0, 0),
                    //       spreadRadius: 5)
                    // ],

                    color: Colors.white,
                    //border: Border.all(color:Colors.black12 ,width :3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Ingradients',
                          style: Theme.of(context).textTheme.title),
                      Container(
                        padding: const EdgeInsets.only(left: 30),

                        // color: Colors.white,
                        height: 160,
                        width: 205,
                        child: ListView.builder(
                            itemCount: currentMeal.ingredients.length,
                            itemBuilder: (ctx, index) {
                              return Text(currentMeal.ingredients[index]);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///////////////////////////STEPS ////////////////////////////////////////
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: md.height * 0.45,
                  width: md.width * 0.75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 2,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Steps',
                        style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 40, backgroundColor: Colors.white38),
                      ),
                      Container(
                        alignment: Alignment.center,
                        // color: Colors.white,
                        height: md.height * 0.45 - 55,

                        child: ListWheelScrollView(
                          clipToSize: true,
                          itemExtent: 110, 
                          children: currentMeal.steps.map((step) {
                            return ListTile(
                                leading: CircleAvatar(
                                  child: Text((i++).toString()),
                                ),
                                title: Text(
                                  step,
                                  style: TextStyle(
                                      backgroundColor: Colors.white60),
                                ));
                          }).toList(),

                          // child: ListView.builder(
                          //     itemCount: currentMeal.steps.length,
                          //     itemBuilder: (ctx, index) {
                          //       return ListTile(
                          //           leading: CircleAvatar(
                          //             child: Text((index + 1).toString()),
                          //           ),
                          //           title: Text(
                          //             currentMeal.steps[index],
                          //             style: TextStyle(
                          //                 backgroundColor: Colors.white60),
                          //           ));
                          //     }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: _buildFloatingButtons(),
        colorStartAnimation: Colors.indigo,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  }
}
