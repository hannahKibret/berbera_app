import 'package:berbera_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget{
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primaryColor: Color(0xFFFFA500),
        fontFamily: 'Helvetica',
    ),
      home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Verification Code', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter your verification code',
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58.0),
                child: ButtonTheme(
                  minWidth: 150,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                          settings: RouteSettings(arguments: ''),
                        ),
                      );
                    },
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: Text("Continue".toUpperCase(),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),

    )
    );
  }
}