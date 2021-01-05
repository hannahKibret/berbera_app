import 'package:berbera_app/pages/sign_up_page2.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp1 extends StatefulWidget {
  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  APIService apiService;

  @override
  void initstate() {
    super.initState();
    apiService = new APIService();
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    bool isAPIcallProcess = false;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFFA500),
        fontFamily: 'Helvetica',
      ),
      home: Scaffold(
        //backgroundColor: Colors.white,
        body: ListView(shrinkWrap: true, children: <Widget>[
          Card(
            elevation: 5.0,
            margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 0, 20),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              fontFamily: 'helvetica'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        child: Text(
                          'Welcome To Berbera Market. Please fill in the',
                          style: TextStyle(
                              fontFamily: 'helvetica', color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Text(
                          'form below to sign up.',
                          style: TextStyle(
                              fontFamily: 'helvetica', color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            labelText: 'Full Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Enter your number',
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your username',
                            labelText: 'Username',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 28.0, right: 20, top: 40),
                          child: ButtonTheme(
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp2(),
                                    settings: RouteSettings(arguments: ''),
                                  ),
                                );
                              },
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text("Continue".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )),
                    ],
                  ),
                )),
          )
        ]),
      ),
      //Text('kjfdjfb')
    );
  }
}
