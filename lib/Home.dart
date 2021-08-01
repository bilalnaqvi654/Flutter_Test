import 'package:flutter/material.dart';
import 'package:fluttertask/DatabaseHelper.dart';
import 'package:fluttertask/Favpage.dart';
import 'package:fluttertask/HomePage.dart';
import 'package:fluttertask/Models/FavModel.dart';
import 'package:fluttertask/NotificationService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pageList = [];

  SendNotification() async {
    DBHelper dbhelper = DBHelper();
    NotificationService notificationService = NotificationService();
    Future<List<FavouriteModel>> listNotification = dbhelper.getFavs();
    List<FavouriteModel> list1 = await listNotification;

    print(list1[1].name);
    list1.shuffle();
    notificationService.sheduledNotification(
        list1[3].name, list1[3].description);
  }

  int _currentIndex = 0;

  DBHelper dbHelper = DBHelper();
  bool isSelect = false;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageList.add(Homepage());
    pageList.add(Favourite());
    SendNotification();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: (_currentIndex == 0)
              ? Text(
                  'Drink Recipes',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  'Favrourite Recipies',
                  style: TextStyle(color: Colors.white),
                ),
          backgroundColor: Colors.indigo),
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: (_currentIndex == 0)
                ? new Icon(Icons.home)
                : new Icon(Icons.home_outlined),
            title: new Text(
              'HOME',
              style: TextStyle(
                  color: (_currentIndex == 0) ? Colors.white : Colors.white),
            ),
            //  backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: (_currentIndex == 1)
                ? new Icon(Icons.favorite)
                : Icon(Icons.favorite_outline),
            title: new Text(
              'Favourites',
              style: TextStyle(
                  color: (_currentIndex == 1) ? Colors.white : Colors.white),
            ),
            //     backgroundColor: Colors.blue
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    isSelect = true;
    setState(() {
      _currentIndex = index;
    });
  }
}
