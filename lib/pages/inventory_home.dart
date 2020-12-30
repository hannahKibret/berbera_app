import 'package:flutter/material.dart';

import 'inventory_add.dart';
import 'inventory_view.dart';

class InventoryHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 55.0),
        child: ListView(
          children:[
            SizedBox(height:35.0),
            GestureDetector(
              child: Card(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:20.0),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.orange,
                    ),
                    SizedBox(height:20.0),
                    Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height:20.0),
                  ],
                ),
              ),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> InventoryAdd(itemName:'',brandName:'',category:'',price:0,qty:0,itemDetail:'',image:null),
                    settings: RouteSettings(
                        arguments: ''
                    ),
                  ),
                );
              }
            ),
            SizedBox(height:35.0),
            GestureDetector(
              child: Card(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:20.0),
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.orange,
                    ),
                    SizedBox(height:20.0),
                    Text(
                      'View',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height:20.0),
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> InventoryView(),
                    settings: RouteSettings(
                        arguments: ''
                    ),
                  ),
                );
              },
            ),
            SizedBox(height:35.0),
//            GestureDetector(
//              child: Card(
//                child:Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: [
//                    SizedBox(height:20.0),
//                    Icon(
//                      Icons.search,
//                      color: Colors.orange,
//                    ),
//                    SizedBox(height:20.0),
//                    Text(
//                      'Search',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20.0,
//                      ),
//                    ),
//                    SizedBox(height:20.0),
//                  ],
//                ),
//              ),
//              onTap: (){
//
//              },
//
//            ),
//            SizedBox(height:35.0),
          ]
        ),
      )
    );
  }

}