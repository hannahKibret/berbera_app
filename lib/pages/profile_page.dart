import 'package:flutter/material.dart';
import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/pages/term_page.dart';
import 'package:berbera_app/pages/feedback_page.dart';
//import 'package:berbera_app/pages/edit_account.dart';

import '../models/User.dart';
import 'about.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {

  User user = User();


@override
  void initstate(){
    super.initState();
    user.first_name = Config.firstname;
    user.last_name = Config.lastname;
    user.email = Config.email;
    
  


  }

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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
          //   child: ListTile(

          //       title: Text('Edit Account',style: TextStyle(fontSize: 20,),),
          //       leading: Icon(Icons.edit, color: Colors.orangeAccent,),
          //       trailing: IconButton(
          //         icon: Icon(Icons.chevron_right,color:Colors.black),
          //         onPressed: (){
          //            Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => EditAccount(firstname: user.first_name,lastname: user.last_name, email: user.email),
          //         settings: RouteSettings(arguments: ''),
          //       ),
          //     );
          //         },
          //         ),
          //     ),
          //   ),
             
        
           Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
            child: ListTile(

                title: Text('Feedback',style: TextStyle(fontSize: 20,),),
                leading: Icon(Icons.feedback, color: Colors.orangeAccent,),
                trailing: IconButton(
                  icon: Icon(Icons.chevron_right,color:Colors.black),
                  onPressed: (){
                     Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Feed(),
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