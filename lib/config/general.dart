

import 'package:berbera_app/models/product_attribute.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:berbera_app/models/category.dart';

import 'Config.dart';

  const kLOG_TAG = "[Berbera]";
  const kLOG_ENABLE = true;
  bool checked = true;
  void printLog(dynamic data) {
    if (kLOG_ENABLE) {
      /// "y-m-d h:min:sec.msZ"
      final String now = DateTime.now().toUtc().toString().split(' ').last;
      debugPrint("[$now]$kLOG_TAG${data.toString()}");
    }
  }

const kDefaultImage =
    "https://trello-attachments.s3.amazonaws.com/5d64f19a7cd71013a9a418cf/640x480/1dfc14f78ab0dbb3de0e62ae7ebded0c/placeholder.jpg";
const kNotStrictVisibleVariant = true;

const kAdvanceConfig = {
  "EnableAttributesConfigurableProduct": ["color", "size"],
};


const List<DropdownMenuItem<dynamic>> product_types = [DropdownMenuItem(child: Text("Simple Products"), value: "simple",),
  DropdownMenuItem(child: Text("Variable Products"), value: "variable",)];

const List<DropdownMenuItem<dynamic>> product_status = [DropdownMenuItem(child: Text("In Stock"), value: "simple",),
  DropdownMenuItem(child: Text("Out of stock"), value: "variable",)];

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
 return image;
}

List<Widget> getAttributeWidget(String id){
  APIService apiService;
  apiService = new APIService();
  List<Widget> _widgets = [];
  try{
    apiService.getAttribute(id).then((value) {
      List<Attribute> _attributes = value;
      for(int i=0; i< _attributes.length; i++){
        _widgets.add( Row(
          children: [
            Checkbox(value: checked, onChanged: (checked){
              checked = !checked;
              
            },),
            Text(_attributes[i].name),
          ],
        ));
      }
    });
    return _widgets;
  }catch(e){
printLog(e.toString());
  }

}
 getCategory(){
  APIService apiService;
  apiService = new APIService();
  List<Map<String,bool>> _cats = [];
Map<String,bool> s ={};
  try{
    apiService.getcategories().then((value) {
     value.forEach((val){Config.ids.add(val.id);});
     print('catttttttttttttttt$value');
   
   for(Category val in value){
    
     Config.catMaps.add({val.name : false});
      
   }
  // s = {for(Category val in value) '${val.name}': false};
     
    });
    print('ratttttttttttttttt${Config.catMaps}');
   
  }catch(e){
printLog(e.toString());
  }

}

Widget getVariationWidget( color, size){
  return Row(
    children: [
      DropdownButtonFormField(items: color, onChanged: null),
      DropdownButtonFormField(items: size, onChanged: null)
    ],
  );
}
