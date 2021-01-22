import 'package:flutter/material.dart';


class About extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: Colors.grey[100],
        appBar: AppBar(
        title: Text('Berbera',style: TextStyle(color: Colors.white),),
   

    ),
     body:Container(
          width:MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),

              child: Text('Berbera providing you with a personalized store front billboard to help you create larger customer exposure contact our customer service for more contact'),

            ),
            Divider(
              height:2.0,
              thickness: 1.0,
              color:Colors.deepOrange,

            ),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),

              child: Text('The current market is all about making customer want the item by making it look important, we have some psychological marketing training organized to help you get more than you do today'),

            ),
            Divider(
              height:2.0,
              thickness: 1.0,
              color:Colors.orangeAccent,

            ),
          ]
        )

     ),
    );
  }
}