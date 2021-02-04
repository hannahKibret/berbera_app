import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:berbera_app/config/Config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class  Feed extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feed> {
  APIService apiService = new APIService();
  bool isAPIcallProcess = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
        
        title: Text('Feedback',style:TextStyle(color:Colors.white)),

      ),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:10.0 ),
        child:FutureBuilder(
          future: apiService.getReviews(Config.storeid),
          builder: (BuildContext context,AsyncSnapshot snapshot ) {
            if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data.length == 0){
              return Center(child: Text('No Reviews',style: TextStyle(color: Colors.black)));
            }

            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  // downloadImagee(snap.data.documents[index]['image']);
                  return Card(
                    color: Colors.white,
                    
                    child: Wrap(
                      children:[ Padding(
                      padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                      child: SizedBox(
                        
                      
                     // color: Colors.white,
                     // height: 60.0,
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 15.0, horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[

                              Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text('${snapshot.data[index].review_title}',style:TextStyle(color:Colors.black)),
                                  // SizedBox(height: 10.0),
                                  Text(snapshot.data[index].review_description,style:TextStyle(color:Colors.black)),
                                  SizedBox(height: 10.0),
                                  Text(snapshot.data[index].created,style:TextStyle(color:Colors.grey[500],fontSize: 11.0)),
                                ]


                              )
                              ),
                               RatingBar.builder(
                                initialRating: double.parse(snapshot.data[index].review_rating),
                                minRating: 1,
                                itemSize: 13.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                                
                              )
                            ]

                          ),
                          ),
                      //child: Text(snapshot.data[index].message),
                    ),
                    ],
                  ),
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

