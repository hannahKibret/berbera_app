import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_platform/universal_platform.dart';

  const kLOG_TAG = "[Berbera]";
  const kLOG_ENABLE = true;

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