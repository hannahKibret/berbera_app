import 'package:berbera_app/pages/inventory_home.dart';
import 'package:berbera_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFFFA500),
          accentColor: Colors.purple[900],
          fontFamily: 'Helvetica',
        ),
      home: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        //title: Text('Bottom Navigation Bar'),
        centerTitle: true,
      ),

      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: currentIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        onTap: changePage,
        items: [
          BubbleBottomBarItem(
            backgroundColor: Colors.purple[900],
            icon: Icon(
              Icons.dashboard,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.purple[900],
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.purple[900],
            icon: Icon(
              Icons.store,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              Icons.store,
              color: Colors.purple[900],
            ),
            title: Text('Inventory'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.purple[900],
            icon: Icon(
              Icons.assignment,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              Icons.assignment,
              color: Colors.purple[900],
            ),
            title: Text('Orders'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.purple[900],
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.purple[900],
            ),
            title: Text('Profile'),
          ),
        ],
      ),
      body: (currentIndex == 0)
          ?
      Icon(
        Icons.folder_open,
        size: 150.0,
        color: Colors.indigo,
      )
          : (currentIndex == 1)
          ? InventoryHome()
          : (currentIndex == 3)
          ? ProfilePage()
          : Icon(
            Icons.access_time,
            size: 150.0,
            color: Colors.deepPurple,
          ),
      )
    );
  }
}