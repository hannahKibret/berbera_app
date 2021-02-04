import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:berbera_app/config/Config.dart';
import 'home_page.dart';
import 'sign_up_page1.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool isApiProcess = false;
  GlobalKey<FormState> globalkey = GlobalKey<FormState>();
String username;
String password;
APIService apiService;
  @override
  void initstate(){
    super.initState();

  }
 // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.4;
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFFA500),
        fontFamily: 'Helvetica',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: BezierClipper(),
              child: Container(
                color: Color.fromRGBO(255, 165, 0, 1),
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WELCOME',
                      style: TextStyle(
                          fontFamily: 'helvetica',
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        'to',
                        style: TextStyle(
                            fontFamily: 'helvetica',
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'BERBERA',
                          style: TextStyle(
                              fontFamily: 'helvetica',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Image.asset(
                              'assets/images/berbera_logo.png',
                              width: 100,
                              height: 100,
                            )),
                        Text('MARKET',
                            style: TextStyle(
                                fontFamily: 'helvetica',
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                )
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.only(top: height * 1.0),
                  child: Form(
                    key: globalkey,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged:(text) {username = text;},
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone),
                          //  hintText: 'Enter your number',
                            labelText: 'Email',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextFormField(
                            obscureText: true,
                            onChanged:(text) {password = text;},
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.vpn_key),
                              hintText: 'Enter your password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: ButtonTheme(
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Theme.of(context).primaryColor)),
                              onPressed: () {
                                //TODO: login Action

                                setState(() {
                                  isApiProcess = true;
                                });
                                apiService = new APIService();
                                apiService.loginUser(username, password).then((user) {
                                  print(username+password);
                                //  print(model.code);
                                if(user != null){
                                print(user.data.toJson());
                                print('token ${Config.token}');

                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text("Log in"),
                                      content: Text("LOGIN OK"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("okay"),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage(),
                                                settings: RouteSettings(arguments: ''),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                              }
                                else{
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text("Log in"),
                                      content: Text("LOGIN Faild"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CANCEL"),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();

                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                }
                                );

                             /*   Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                    settings: RouteSettings(arguments: ''),
                                  ),
                                ); */
                              },
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text("sign in".toUpperCase(),
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Don\'t have an account?'),
                              ButtonTheme(
                                minWidth: 10,
                                child: FlatButton (
                                    child: Text('Sign up.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp1(),
                                        settings: RouteSettings(arguments: ''),
                                      ),
                                    );
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 363.15;
    path.lineTo(
        -0.003999999999997783 * _xScaling, 341.78499999999997 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      23.461000000000002 * _xScaling,
      363.15099999999995 * _yScaling,
      71.553 * _xScaling,
      363.15099999999995 * _yScaling,
    );
    path.cubicTo(
      119.645 * _xScaling,
      363.15099999999995 * _yScaling,
      142.21699999999998 * _xScaling,
      300.186 * _yScaling,
      203.29500000000002 * _xScaling,
      307.21 * _yScaling,
    );
    path.cubicTo(
      264.373 * _xScaling,
      314.234 * _yScaling,
      282.666 * _xScaling,
      333.47299999999996 * _yScaling,
      338.408 * _xScaling,
      333.47299999999996 * _yScaling,
    );
    path.cubicTo(
      394.15000000000003 * _xScaling,
      333.47299999999996 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
    );
    return path;
  }
}
