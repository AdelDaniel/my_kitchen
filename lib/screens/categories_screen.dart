import 'package:flutter/material.dart';


import '../models/3.2 dummy_data.dart.dart';
// import '../models/category.dart';
import '../widgets/category_item.dart';


class CategoryScreen extends StatelessWidget {
  static const String id = 'CategoryScreen' ; 

  @override
  Widget build(BuildContext context) {
    print( 'h=' +  MediaQuery.of(context).size.height.toString() );
    print( 'w=' +  MediaQuery.of(context).size.width.toString()  );
    return Scaffold(
          body: GridView(
        children: DUMMY_CATEGORIES.map(
          (cat) {
            return CategoryItem( cat: cat, );
          }
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500 ,
          childAspectRatio: 3/2 ,
          crossAxisSpacing: 1,
          mainAxisSpacing: 20 ,
          
        ),

        ),
    );
      
    
  }
}