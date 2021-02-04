import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';

import 'order_page.dart';

class OrderHome extends StatelessWidget{
  static APIService apiService = new APIService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: ListView(children: [
            SizedBox(height: 35.0),
            GestureDetector(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,40.0, 10.0, 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SizedBox(width: 20.0),
                        Icon(
                          Icons.access_time,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'Processing Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 40.0),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(futureMethod: apiService.getPendingOrders(),),
                    settings: RouteSettings(arguments: ''),
                  ),
                );
              },),
            SizedBox(height: 35.0),
            GestureDetector(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,40.0, 10.0, 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //SizedBox(height: 20.0),
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(futureMethod: apiService.getOrders(),),
                    settings: RouteSettings(arguments: ''),
                  ),
                );
              },
            ),
            SizedBox(height: 35.0),
          ]),
        ));
  }

}