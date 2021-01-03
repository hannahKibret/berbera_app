import 'package:flutter/material.dart';

class Orders extends StatefulWidget{
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Item',style:TextStyle(color:Colors.white)),
    actions: <Widget>[
    IconButton(icon: Icon(Icons.filter_alt_outlined, color: Colors.white), onPressed: (){

    },),
    SizedBox(width: 20.0,), 
    ],
    ),
      body: Center(),
    );
  }
}
