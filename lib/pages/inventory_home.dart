import 'package:flutter/material.dart';

import 'inventory_add.dart';
import 'inventory_view.dart';

class InventoryHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
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
                    //SizedBox(height: 20.0),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Add Products',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
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
                  builder: (context) => InventoryAdd(
                      ),
                ),
              );
            }),
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
                    'View Products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
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
                builder: (context) => InventoryView(),
             //   settings: RouteSettings(arguments: ''),
              ),
            );
          },
        ),
        SizedBox(height: 35.0),
      ]),
    ));
  }
}
