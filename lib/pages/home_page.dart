import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/pages/inventory_home.dart';
import 'package:berbera_app/pages/profile_page.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'home.dart';
import 'notification_page.dart';
import 'order/order_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    APIService apiService = new APIService();
    print("APP STARTED");
apiService.get_full_user_data().then((value) => Config.userInfo = value);
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
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                        settings: RouteSettings(arguments: ''),
                      ),
                    );

                  }
              )
            ],
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
                  Icons.home,//home_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.home,//home_outlined,
                  color: Colors.purple[900],
                ),
                title: Text('Home'),
              ),
              BubbleBottomBarItem(
                backgroundColor: Colors.purple[900],
                icon: Icon(
                  Icons.shopping_cart,//add_shopping_cart_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,//add_shopping_cart_outlined,
                  color: Colors.purple[900],
                ),
                title: Text('Orders'),
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
              ? Home()
              : (currentIndex == 1)
                ? OrderHome()
                : (currentIndex == 2)
                    ? InventoryHome()
                  : (currentIndex == 3)
                      ? ProfilePage()
                      : Icon(
                          Icons.access_time,
                          size: 150.0,
                          color: Colors.deepPurple,
                        ),
        ));
  }
}
