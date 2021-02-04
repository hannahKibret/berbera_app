import 'package:berbera_app/models/User.dart';
import 'package:berbera_app/models/Vendor.dart';
import 'package:berbera_app/pages/sign_up_page2.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'sign_up_page3.dart';
import 'verification_page.dart';

class SignUp1 extends StatefulWidget{

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {

  APIService apiService = new APIService();
  User  user = new User();
  


  @override
  void initstate(){
    super.initState();


    GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  }
  bool isAPIcallProcess = false;
  final _formKey = GlobalKey<FormState>();
  bool _formChanged = false;
  String _username;
  String _password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFFFA500),
          fontFamily: 'Helvetica',
        ),
        home: Scaffold(
          //backgroundColor: Colors.white,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                elevation: 5.0,
                margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                      child: Form(
                        key: _formKey,
                        onChanged: _onFormChange,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 50, 0, 20),
                              child: Text('Sign up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'helvetica'),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                              child: Text('Welcome To Berbera Market. Please fill in the', style: TextStyle(fontFamily: 'helvetica', color: Colors.grey),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                              child: Text('form below to sign up.', style: TextStyle(fontFamily: 'helvetica', color: Colors.grey),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                onChanged: (val) => user.first_name = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your first name',
                                  labelText: 'First Name',
                                ),
                              autovalidate: _formChanged,
                              validator: (String val) {
                                if (val.isEmpty)
                                  return "Enter an first name";
                                return null;
                              },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                //keyboardType: TextInputType.number,
                                onChanged: (val) => user.last_name = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your last name',
                                  labelText: 'Last Name',
                                ),
                              autovalidate: _formChanged,
                              validator: (String val) {
                                if (val.isEmpty)
                                  return "Enter an last name";
                                return null;
                              },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) => user.email = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                  labelText: 'Email',
                                ),
                                autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty)
                                    return "Enter an email";
                                  return null;
                                },
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) =>  user.phone = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your phone number',
                                  labelText: 'Phone Number',
                                ),
                                 autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty)
                                    return "Enter an phone number";
                                  return null;
                                },
                              ),
                            ),
                              Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                 onChanged: (val) =>  user.store_name = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your username',
                                  labelText: 'Store name',
                                ),
                                autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty)
                                    return "Enter an store name";
                                  return null;
                                },
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                 onChanged: (val) =>  user.username = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your username',
                                  labelText: 'Username',
                                ),
                                autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty)
                                    return "Enter an username";
                                  return null;
                                },
                              ),

                            ),
                             Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                 onChanged: (val) =>  _password = val,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  labelText: 'Password',
                                ),
                                autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty){
                                    return "Enter your password";
                                  }else if(val.length < 8){
                                    return "Password should be atleast 8 characters long";
                                  }
                                  return null;
                                },
                              ),

                            ),
                             Padding(
                              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                  onChanged: (val) =>  user.user_pass = val,
                                decoration: const InputDecoration(
                                  hintText: 'Confirm your password',
                                  labelText: 'Confirm Password',
                                ),
                                autovalidate: _formChanged,
                                validator: (String val) {
                                  if (val.isEmpty){
                                    return "Confirm your password";
                                  }else if(_password != user.user_pass){
                                    return "Your password doesn't match";
                                  }
                                  return null;
                                },
                              ),

                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 28.0, right: 20, top: 40),
                                child: ButtonTheme(
                                  height: 50,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(color: Theme.of(context).primaryColor)),
                                    onPressed: _formChanged
                                        ? () {
                                      user.role = 'wcfm_vendor';
                                      user.user_email = user.email;
                                      user.user_login =user.username;
                                      Value value = Value();
                                      value.phone = user.phone;
                                      value.store_name = user.store_name;
                                      List<Map<String,dynamic>> values = [{'phone': value.phone,'store_name': value.store_name}];

                                      //List<Map<String,dynamic>> values =[{'value':value}];
                                      user.meta_data = [{'id': 124, 'key': 'wcfmmp_profile_settings','value':values}];
                                      print('name: ${user.toJSON()}');
                                      setState((){
                                        isAPIcallProcess = true;

                                      });
                                     
                                      apiService.createUser(user).then(
                                          (ret){
                                            
                                            
                                            ((){
                                              isAPIcallProcess = false;

                                            });
                                            if(ret){
                                              apiService.loginUser(user.username, user.user_pass);
                                               Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => HomePage(),
                                                  settings: RouteSettings(arguments: ''),
                                                ),
                                              );
                                            }else{
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => SignUp1(),
                                              //     settings: RouteSettings(arguments: ''),
                                              //   ),
                                              // );


                                            }
                                          }
                                      );
                                      

                                    } : null,
                                    textColor: Colors.white,
                                    color: Theme.of(context).primaryColor,
                                    child: Text("Sign up".toUpperCase(),
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                  ),
                                )
                            ),
                          ],
                        ),
                      )

                    ),
                  )
              ]
                ),
              ),
              //Text('kjfdjfb')
          );

  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }
}