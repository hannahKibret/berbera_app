import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:berbera_app/models/Notification.dart';

import 'inventory_add.dart';

class  NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  APIService apiService = new APIService();
  bool isAPIcallProcess = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
        
        title: Text('Notification',style:TextStyle(color:Colors.white)),

      ),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:10.0 ),
        child:FutureBuilder(
          future: apiService.getNotifications(),
          builder: (BuildContext context,AsyncSnapshot snapshot ) {
            if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data.length == 0){
              return Center(child: Text('No notification',style: TextStyle(color: Colors.black)));
            }

            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  // downloadImagee(snap.data.documents[index]['image']);
                  return Card(
                    color: Colors.white,
                    
                    child: Wrap(
                      children: [
                        Padding(
                      padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                      child: SizedBox(
                        
                      
                     // color: Colors.white,
                      //height: 60.0,
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 15.0, horizontal: 15.0),
                          child: Row(
                            children:[

                              Icon(Icons.notifications_active,color:Colors.grey[700]),
                              SizedBox(width: 10.0),
                              Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data[index].message,style:TextStyle(color:Colors.black)),
                                  SizedBox(height: 10.0),
                                  Text(snapshot.data[index].created,style:TextStyle(color:Colors.grey[500],fontSize: 11.0)),
                                ]


                              )
                              )
                            ]

                          ),
                          ),
                      //child: Text(snapshot.data[index].message),
                    ),
                    ],),
                  );
                }

            );
            }else{
              return Center(
                child: CircularProgressIndicator()
              );
            }

          }
        ),
      ),
    );
  }

}

