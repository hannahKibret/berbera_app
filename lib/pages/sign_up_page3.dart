import 'package:berbera_app/pages/verification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp3 extends StatefulWidget {
  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  var _catB = [
    'Abay Bank',
    'Abyssinia Bank',
    'Addis International Bank',
    'Awash International Bank',
    'Berhan International Bank',
    'Bunna International Bank',
    'Commercial Bank Of Ethiopia',
    'Cooperative Bank Of Oromia',
    'Dashen Bank',
    'Debub Global Bank',
    'Enat Bank',
    'Lion International Bank',
    'Nib International Bank',
    'Oromia International Bank',
    'United Bank',
    'Wegagen Bank',
    'Zemen Bank',
  ];
  String _currentCategorySelected = 'Abay Bank';
  bool checkedValue = false;
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
                          'Bank Information',
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
                        padding: const EdgeInsets.only(top: 40.0, left: 20),
                        child: Text(
                          'Choose your bank',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, right: 20),
                        child: DropdownButtonFormField(
                          items: _catB.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              this._currentCategorySelected = value;
                            });
                          },
                          value: _currentCategorySelected,
                          onSaved: (String value) {
                            _currentCategorySelected = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Enter your account no',
                            labelText: 'Account Number',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CheckboxListTile(
                          title: Text(
                            'By checking this box you are agreeing to berbera\'s terms and conditions',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          checkColor: Colors.white,
                          activeColor: Colors.orangeAccent,
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 28.0, right: 20, top: 10),
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
                                    builder: (context) => Verification(),
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
