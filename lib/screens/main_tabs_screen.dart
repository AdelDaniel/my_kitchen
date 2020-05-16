import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/drawer.dart';
import './categories_screen.dart';
import './star_meal_screen.dart';

class MainTabsScreen extends StatefulWidget {
  @override
  _MainTabsScreenState createState() => _MainTabsScreenState();
}


class _MainTabsScreenState extends State<MainTabsScreen> {

  List<Widget>  _pages ;
  int choosePage = 0 ;
  void _selectedTap(int value) {
    setState(() {
      choosePage = value ; 
    });
  }
  @override
  void initState() {
    
    _pages = [
    CategoryScreen(),
    StarMealsScreen(), //StarMealsScreen(widget.starMeals),
  ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[choosePage] ,
      
      appBar: AppBar(title:choosePage == 0 ? Text(   'categories' ):Text ( 'Star' ,),),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTap ,
        elevation: 5,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white54,
        fixedColor: Colors.black,
        iconSize: 15,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: choosePage,
        selectedFontSize: 20,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black26,
        selectedIconTheme: IconThemeData( size: 25),


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category) , title: Text('categories')),
          BottomNavigationBarItem(icon: Icon(Icons.star) , title: Text('Star')),
        ],

      ),
       
    );
  }
}




// DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             indicatorWeight: 1,
//             tabs: [
//             Tab( icon: Icon(Icons.category) ,text: 'categories', ),
//             Tab( icon: Icon(Icons.star) ,text: 'Star', ),
//             // Tab( icon: Icon(Icons.schedule) ,text: 'Will Do', ),

//           ]),

//         ),
//         body: TabBarView(
          
//           children: <Widget>[
//           CategoryScreen(),
//           StarMeals(),



//         ],),
//       ),
      
//     );