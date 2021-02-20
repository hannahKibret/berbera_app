import 'package:berbera_app/models/Order.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final String idd;
  OrderDetail(this.idd);
  APIService apiService = new APIService();
  Color col = Colors.grey[400];
  Color col2 = Colors.grey[400];
  Color col3 = Colors.grey[400];
  Color col4 = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
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
                if(snapshot.data.status == 'processing'){
                  col = Colors.orange;
                }
                else if(snapshot.data.status == 'completed'){
                  col2 = Colors.orange;
                }
                else if(snapshot.data.status == 'cancelled'){
                  col3 = Colors.orange;
                }
                else if(snapshot.data.status == 'refunded'){
                  col4 = Colors.orange;
                }
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.lineItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Card(
                                        //TODO: check image URL
                                     //   child: Image.network(snapshot.data.lineItems[index].featuredImage, fit: BoxFit.fitWidth, height: MediaQuery.of(context).size.height * 0.13,),
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Item name: ' + snapshot.data.lineItems[index].name, style: TextStyle(fontSize: 18),),
                                          SizedBox(height: 8,),
                                          Text('Quantity: ' + snapshot.data.lineItems[index].quantity.toString(), style: TextStyle(fontSize: 18),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 65,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.grey[200],
                                      //height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Item Price: ', style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),),
                                            Text('Br'+ snapshot.data.lineItems[index].total.toString(), style: TextStyle(fontSize: 18,),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        height: 160,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[200]),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.grey[200],
                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: <Widget>[
                                //     Text('Subtotal: ', style: TextStyle(fontSize: 18,),),
                                //     Text('Br'+ snapshot.data.subtotal.toString(), style: TextStyle(fontSize: 18,),)
                                //   ],
                                // ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Shipping Method: ', style: TextStyle(fontSize: 18,),),
                                    Text(snapshot.data.shippingMethodTitle, style: TextStyle(fontSize: 18,),)
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Total tax: ', style: TextStyle(fontSize: 18,),),
                                    Text('Br'+ snapshot.data.totalTax.toString(), style: TextStyle(fontSize: 18,),)
                                  ],
                                ),
                                Divider(color: Colors.black,),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Total: ', style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),),
                                    Text('Br'+ snapshot.data.total.toString(), style: TextStyle(fontSize: 18,),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text('Status', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[200]),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(snapshot.data.createdAt.toString().substring(0,10),),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(child: Text('1', style: TextStyle(color: Colors.white, fontSize: 15),)),
                                          decoration: BoxDecoration(
                                              color: col,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                        Text('Processing', style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('                 '),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(child: Text('2', style: TextStyle(color: Colors.white, fontSize: 15),)),
                                          decoration: BoxDecoration(
                                              color: col2,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                        Text('Completed', style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('                 '),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(child: Text('3', style: TextStyle(color: Colors.white, fontSize: 15),)),
                                          decoration: BoxDecoration(
                                              color: col3,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                        Text('Cancelled', style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(snapshot.data.dateModified.toString().substring(0,10),),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(child: Text('4', style: TextStyle(color: Colors.white, fontSize: 15),)),
                                          decoration: BoxDecoration(
                                              color: col4,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                        Text('Refunded', style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                ],
                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Shipping Address', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(snapshot.data.shipping.toString(), style: TextStyle(fontSize: 17),),
                      ),
                    ],
                  ),
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