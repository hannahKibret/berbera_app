import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';

import 'Order_detail.dart';

class OrderPage extends StatefulWidget {
  var futureMethod;

  OrderPage({ Key key, this.futureMethod }): super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //static APIService apiService = new APIService();
  //var futureMethod = apiService.getOrders();
  Color containerColor;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Orders', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: FutureBuilder(
                future: widget.futureMethod,//apiService.getOrders(),
                builder: (BuildContext context,AsyncSnapshot snapshot ) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data.length == 0) {
                      return Center(child: Text('No Order',
                          style: TextStyle(color: Colors.black, fontSize: 16)));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.length, //items.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          // downloadImagee(snap.data.documents[index]['image']);
                          if(snapshot.data[index].status == 'completed'){
                            containerColor = Colors.green;
                          }
                          else if(snapshot.data[index].status == 'processing'){
                            containerColor = Colors.yellow;
                          }
                          else if(snapshot.data[index].status == 'cancelled'){
                            containerColor = Colors.red;
                          }
                          else if(snapshot.data[index].status == 'refunded'){
                            containerColor = Colors.cyanAccent;
                          }
                          return GestureDetector(
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 20,
                                      height: 80,
                                      color: containerColor,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text('Order ID: ',
                                                //items[index].itemName,
                                                style: TextStyle(
                                                    fontSize: 18.0)),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                                snapshot.data[index].id,
                                                //items[index].itemName,
                                                style: TextStyle(
                                                    fontSize: 18.0)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text('Date: ',
                                                //items[index].itemName,
                                                style: TextStyle(
                                                    fontSize: 18.0)),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                                snapshot.data[index].createdAt.toString().substring(0,10),
                                                //items[index].itemName,
                                                style: TextStyle(
                                                    fontSize: 18.0)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.chevron_right,
                                          color: Colors.black),
                                      /*onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => InventoryAdd(
                                                itemName: items[index].itemName,
                                                brandName: items[index].brandName,
                                                category: items[index].category,
                                                price: items[index].price,
                                                qty: items[index].qty,
                                                itemDetail: items[index].detail,
                                                image: null),
                                            settings: RouteSettings(arguments: ''),
                                          ),
                                        );
                                      }*/
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderDetail(snapshot.data[index].id),
                                  settings: RouteSettings(arguments: ''),
                                ),
                              );
                            },
                          );
                        });
                  }else{
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }
                })),
        ));
  }
}
