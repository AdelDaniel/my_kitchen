
import 'package:flutter/material.dart';

import '../models/3.2 dummy_data.dart.dart';
import '../models/meal_model.dart';


class MealDetail extends StatelessWidget {

  static const String id = "/MealDetail"; 

  
  

  @override
  Widget build(BuildContext context) {

   
    final md = MediaQuery.of(context).size ;
   final String mealId = ModalRoute.of(context).settings.arguments as String ; 
    final Meal currentMeal = DUMMY_MEALS.firstWhere((meal){
      return meal.id.contains(mealId)  ; 
    });


    return Scaffold(
      body: Container(
        height: md.height,
        decoration: BoxDecoration(
                           image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage(
                     'assets/images/Suggestions+for+the+Best+Italian+Dishes+Kids.png',

               ),

                 )
        ),
        child :Stack(
         children: <Widget>[
           ClipRRect(
             borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                        child: Container(
              
               height: md.height * 20/100 ,
               width: double.infinity,
               alignment: Alignment.bottomCenter,
  
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.black , width: 3 ),
                 

                 color: Colors.green,
                 //border: Border.all(width: 10),
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage(
                     'assets/images/Suggestions+for+the+Best+Italian+Dishes+Kids.png',

               ),

                 )
               ),),
           ),


            Align(
              alignment: Alignment.topCenter,
            child: Column(children:<Widget>[
              SizedBox(
                    height: 40  ,
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                                     CircleAvatar(radius: 40, backgroundColor: Colors.white,),
 Material(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(currentMeal.title , style: Theme.of(context).textTheme.title.copyWith(fontSize:  20)),
                  ),)
                    ],)
            ],)
            ),


              Container(
                alignment: Alignment.centerRight,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.values = [CrossAxisAlignment.start , CrossAxisAlignment.end ,],
                  children: <Widget>[
                    SizedBox(
                    height: md.height * 0.2 +30 ,
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(80),bottomLeft: Radius.circular(80)),
                                          child: Container(
                        width: 200,
               decoration: BoxDecoration(
                 
                 boxShadow: [BoxShadow(
                   blurRadius: 5,
                   color: Colors.grey,
                   offset: Offset(1,5),
                   spreadRadius: 5
                 )],

                 color: Colors.white,
                 //border: Border.all(width: 10),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(80),bottomLeft: Radius.circular(80)),
               ),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                          Text('Ingradients' ,style: Theme.of(context).textTheme.title),
                          Container(
                            padding: const EdgeInsets.only(left : 30),
                            
                           // color: Colors.white,
                              height: 200,
                              //width: 250,
                            child: ListView.builder(
                              itemCount: currentMeal.ingredients.length,
                              itemBuilder: (ctx , index){
                                return Text(currentMeal.ingredients[index]); 
                              }),
                          ),
                        ],),
                      ),
                    ),





                  


                    
                  ],
                  
                ),
              ),



              ///////////////////////////STEPS

                    Padding(
                      padding: const EdgeInsets.only(bottom : 0),
                      child: Align(

                        alignment: Alignment.bottomLeft,
                                            child: ClipRRect(

                          borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80)),
                                              child: Container(
                            padding: const EdgeInsets.only(left : 10),
                          height: md.height * 0.45,
                            width: md.width * 0.75,
               decoration: BoxDecoration(
                 
                //  boxShadow: 
                //  [BoxShadow(
                //    blurRadius: 5,
                //    color: Colors.black,
                //    offset: Offset(-5,5),
                //    spreadRadius: 5
                //  )],

                color: Colors.white,
                 borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80)),
               ),
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                              Text('Steps' ,style: Theme.of(context).textTheme.title.copyWith(fontSize: 40, backgroundColor: Colors.white38) ,),
                                
                        Container(
                                alignment: Alignment.center,
                               // color: Colors.white,
                                  height: md.height * 0.45 -55,
                                 
                                child: ListView.builder(
                                  itemCount: currentMeal.steps.length,
                                  itemBuilder: (ctx , index){
                                    return ListTile(leading: CircleAvatar(child: Text((index+1).toString()),),
                                       title: Text(currentMeal.steps[index] , style: TextStyle(backgroundColor: Colors.white60),)); 
                                  }),
                              ),
                            ],),
                          ),
                        ),
                      ),
                    ),


            //              ClipRRect(
            //                  borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),topRight: Radius.circular(25)),
            //                   child: Container(
            //                     alignment: Alignment.topLeft,
            //                    // color: Colors.yellow,
            //                    padding: const EdgeInsets.only(top: 200 ),
            //                   height: md.height * 60 / 100 ,
            //                   width: 200,
            //    child: Column(children: <Widget>[
            //      Text('Ingradients'),
            //      Container(
            //        color: Colors.white,
            //         height: 100,
            //         width: 200,
            //        child: ListView.builder(
            //          itemCount: currentMeal.ingredients.length,
            //          itemBuilder: (ctx , index){
            //            return Text(currentMeal.ingredients[index]); 
            //          }),
            //      ),
            //    ],),
            //  ),
            //                ),





           
         ],
        ),
        ),
      
    );
  }
}