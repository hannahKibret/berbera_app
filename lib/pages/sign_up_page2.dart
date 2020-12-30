import 'package:berbera_app/pages/sign_up_page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';

class SignUp2 extends StatefulWidget{

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final _formKey1 = GlobalKey<FormState>();
  List<String> allItemList = [
    "Fashion",
    "Electronics",
    "Kids and Toys",
    "Phone and accessories ",
    "Computer and accessories"
  ];
  List<String> selectedItemList;
  var _catS = [
    'Addis Ketema Subcity',
    'Akaki Kality Subcity',
    'Arada Subcity',
    'Bole Subcity',
    'Gulele Subcity',
    'Kirkos Subcity',
    'Kolfe Keraniyo Subcity',
    'Lideta Subcity',
    'Nifas Silk Lafto Subcity',
    'Yeka Subcity',
  ];
  String _currentCategorySelected = 'Addis Ketema Subcity';

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
                      key: _formKey1,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 40, 0, 20),
                            child: Text('Store Information', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'helvetica'),),
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
                              decoration: const InputDecoration(
                                hintText: 'Enter your store name',
                                labelText: 'Store Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20),
                            child: Text('Working Hours', style: TextStyle(fontSize: 17),),
                          ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 150),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Am',
                                      labelText: 'From',
                                    ),
                                  ),

                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 150),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Pm',
                                      labelText: 'To',
                                    ),
                                  ),
                              ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20),
                            child: Text("Categories", style: TextStyle(
                                fontSize: 17),),
                          ),
                          Padding(padding: EdgeInsets.all(10),
                            child: GroupedCheckbox(
                                itemList: allItemList,
                                // checkedItemList: checkedItemList,
                                onChanged: (itemList) {
                                  setState(() {
                                    selectedItemList = itemList;
                                    print('SELECTED ITEM LIST $itemList');
                                  });
                                },
                                orientation: CheckboxOrientation.WRAP,
                                checkColor: Colors.white,
                                activeColor: Colors.orangeAccent
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10, left: 20),
                            child: Text('Sub city', style: TextStyle(fontSize: 17),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                            child: DropdownButtonFormField(
                              items: _catS.map((String dropDownStringItem){
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
                              onSaved: (String value){
                                _currentCategorySelected = value;
                              },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 28.0, right: 20, top: 20, bottom: 20),
                              child: ButtonTheme(
                                height: 50,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Theme.of(context).primaryColor)),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp3(),
                                        settings: RouteSettings(arguments: ''),
                                      ),
                                    );
                                  },
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  child: Text("Continue".toUpperCase(),
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
}