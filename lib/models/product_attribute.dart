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

  ProductAttribute.fromMagentoJson(Map<String, dynamic> parsedJson) {
    id = "${parsedJson["attribute_id"]}";
    name = parsedJson["attribute_code"];
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

  ProductAttribute.fromShopify(att) {
    try {
      id = att['id'];
      name = att['name'];
      options = att['values'];
    } catch (e) {
      printLog(e.toString());
    }
  }

  ProductAttribute.fromPresta(att) {
    try {
      id = att['id'].toString();
      name = att['name'];
      options = att['options'];
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

  Attribute.fromMagentoJson(Map<String, dynamic> parsedJson) {
    id = int.parse(parsedJson["value"]);
    name = parsedJson["attribute_code"];
    option = parsedJson["value"];
  }

  Attribute.fromLocalJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    name = parsedJson["name"];
    option = parsedJson["option"];
  }

  Attribute.fromShopifyJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    name = parsedJson["name"];
    option = parsedJson["value"];
  }

  Attribute.fromPrestaJson(Map<String, dynamic> parsedJson) {
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
