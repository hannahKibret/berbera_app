import 'dart:io';

import 'package:berbera_app/config/general.dart';
import 'package:berbera_app/models/Product.dart';
import 'package:berbera_app/models/category.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:berbera_app/widgets/expansion_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:berbera_app/widgets/category_dropdown_field.dart';

// ignore: must_be_immutable
class InventoryAdd extends StatefulWidget {
Product product;
String title;
  InventoryAdd({product, title});
  @override
  _InventoryAddState createState() => _InventoryAddState(product,title);
}

class _InventoryAddState extends State<InventoryAdd> {
  Product product;
  APIService apiService;
  String title;
  _InventoryAddState(this.product, this.title);

  bool _formChanged = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  File _image;
  // String _downloadURL;
  String _category;

  TextEditingController _controller_name = TextEditingController();
  TextEditingController _controller_description_ = TextEditingController();
  TextEditingController _controller_regualrprice = TextEditingController();
  TextEditingController _controller_salesprice = TextEditingController();
  TextEditingController _controller_stock = TextEditingController();
  TextEditingController _controller_shortdescription = TextEditingController();
  bool _stockisenabled = false;
  String _selected_type;

  List<DropdownMenuItem> category_items =[];

  void initState() {

    focusNode = FocusNode();
category_items =_radio_categry();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title , style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
child: Column(
  children: [
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "General".toUpperCase(),
      children: [
DropdownButtonFormField(items: product_types,
  onChanged:(value){ setState((){
_selected_type = value;
  });},
hint:Text( "Product Type"),
  value: _selected_type,
),
      SizedBox(height: 10,),
      TextFormField(
        decoration: InputDecoration(hintText: "Product Name",labelText: "Title"),
       // controller: _controller_name,
        keyboardType: TextInputType.text,
      ),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(hintText: "Short Description",labelText: "Description"),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        SizedBox(height: 10,),

        TextFormField(
          decoration: InputDecoration(hintText: "Price",labelText: "Regular Price"),
          // controller: _controller_name,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 5,),
        TextFormField(
          decoration: InputDecoration(hintText: "Sales",labelText: "Sales Price"),
          // controller: _controller_name,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 10,),
        DropdownButton(hint:Text("Category") ,
          items: category_items, onChanged: (value){ setState((){
  _selected_type = value;
});},),
        SizedBox(height: 10,),

      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Inventory".toUpperCase(),
      children: [
Row(children: [
  Text("Enable stock managing"),
  Checkbox(value: _stockisenabled, onChanged: (bool value){
    setState(() {
      _stockisenabled = value;
    });
  })
],),
        TextField(keyboardType: TextInputType.number,decoration: InputDecoration(
        //  hintText: "Quantity",
          labelText: "Quantity"
        ),),
        SizedBox(height: 10,),
        DropdownButtonFormField(
          items: product_status,
          onChanged:(value){ setState((){
            _selected_type = value;
          });},
          hint:Text( "Product Type"),
          value: _selected_type,
        )

      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Attributes".toUpperCase(),
      children: [
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.color_lens_outlined, color: Colors.orangeAccent,),
              SizedBox(width: 10),
              Text('Color', style: TextStyle(fontSize: 20,),),
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
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.format_size_outlined, color: Colors.orangeAccent,),
              SizedBox(width: 10),
              Text('Size', style: TextStyle(fontSize: 20,),),
            ],
          ),
          children: <Widget>[
            SizedBox(height: 30,),
            Center(
              child: Text('Your monthly fee: '),

            ),
            SizedBox(height: 30,),
          ],
        )
      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Variation".toUpperCase(),
      children: [

      ],
    ),

  ],
),
        ));

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }
}


List<DropdownMenuItem> _radio_categry(){
  apiService = new APIService();
  List<DropdownMenuItem> _category_items =[];
try{
  printLog("try phase");
  apiService.getcategories().then((value){
    List<Category> _categories = value;
    for(int i=0; i< _categories.length; i++){
      _category_items.add(DropdownMenuItem (child : Row(children: [
        Checkbox(value: true,
            onChanged: (bool value){
            }),
        Text(_categories[i].name)])));
    }
  });
  return _category_items;
}catch(e){
  printLog(e.toString());
}

return _category_items;
}


}
