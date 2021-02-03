import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget{
  APIService apiService = new APIService();
  final String idd;
  OrderDetail(this.idd);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: FutureBuilder(
          future: apiService.getOrders(id: idd),
          builder: (BuildContext context,AsyncSnapshot snapshot ) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height *0.3,
                      color: Colors.purple[900],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60.0, 20.0, 20.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              Text('Order ID: ', style: TextStyle(fontSize: 18, color: Colors.white),),
                              Text(snapshot.data.id, style: TextStyle(fontSize: 18, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Text('Quantity: ', style: TextStyle(fontSize: 18, color: Colors.white),),
                              Text(snapshot.data.quantity.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Text('Price: ', style: TextStyle(fontSize: 18, color: Colors.white),),
                              Text(snapshot.data.total.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Text('Status: ', style: TextStyle(fontSize: 18, color: Colors.white),),
                              Text(snapshot.data.status, style: TextStyle(fontSize: 18, color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Center(
                  child: CircularProgressIndicator()
              );
          }
        ),
      ),
    );
  }

}