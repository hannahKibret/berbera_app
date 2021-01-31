import 'package:berbera_app/config/general.dart';


class ProductAttribute {
  String id;
  String name;
  String slug;
  List options;

  String get cleanSlug => slug?.replaceAll("pa_", "");

  ProductAttribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"].toString();
    name = parsedJson["label"];
    slug = parsedJson["name"];
    options = parsedJson["options"];
  }


  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "options": options};
  }

  ProductAttribute.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id']?.toString();
      name = json['name'];
      options = json['options'];
    } catch (e) {
      printLog(e.toString());
    }
  }


}

class Attribute {
  int id;
  String name;
  String option;

  Attribute();

  Attribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    name = parsedJson["name"];
    option = parsedJson["option"];
  }



  Attribute.fromLocalJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    name = parsedJson["name"];
    option = parsedJson["option"];
  }


  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "option": option};
  }

  @override
  String toString() {
    return '${name ?? ""}${option ?? ""}';
  }
}
