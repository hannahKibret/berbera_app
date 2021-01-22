import 'package:flutter/material.dart';
import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/pages/term_page.dart';

import 'about.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Text(Config.displayname, textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          SizedBox(height: 12.0),
          Text(Config.email, textAlign: TextAlign.center,style: TextStyle(fontSize: 14,),),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 70, 0, 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.edit, color: Colors.orangeAccent,),
                SizedBox(width: 10),
                Text('Edit Profile', style: TextStyle(fontSize: 20,),),
              ],
            ),
          ),
          //SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 30, 0, 0),
            child: ExpansionTile(
              title: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.payment, color: Colors.orangeAccent,),
                  SizedBox(width: 10),
                  Text('Payment', style: TextStyle(fontSize: 20,),),
                ],
              ),
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: Text('Your monthly fee: '),

                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
            child: ExpansionTile(
              title: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.feedback, color: Colors.orangeAccent,),
                  SizedBox(width: 10),
                  Text('Feedback', style: TextStyle(fontSize: 20,),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
            child: ListTile(

              title: Text('Term And Condition',style: TextStyle(fontSize: 20,),),
              leading: Icon(Icons.assignment, color: Colors.orangeAccent,),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right,color:Colors.black),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermPage(),
                      settings: RouteSettings(arguments: ''),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
            child: ListTile(
              title: Text('About Us', style: TextStyle(fontSize: 20,),),
              leading: Icon(Icons.info_outline, color: Colors.orangeAccent,),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right,color:Colors.black),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                      settings: RouteSettings(arguments: ''),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
            child: ListTile(

              title: Text('Log Out', style: TextStyle(fontSize: 20,),),
              leading: Icon(Icons.exit_to_app, color: Colors.orangeAccent,),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right,color:Colors.black),
                onPressed: (){},
              ),
            ),
          )
        ],
      ),
    );
  }
}