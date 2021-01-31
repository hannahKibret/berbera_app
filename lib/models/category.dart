import 'package:berbera_app/config/general.dart';
import 'package:html_unescape/html_unescape.dart';
import 'product.dart';

class Category {
  String id;
  String sku;
  String name;
  var image;
  String parent;
  int totalProduct;
  List<Product> products;


  Category.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson["slug"] == 'uncategorized') {
      return;
    }

    try {
      id = parsedJson["id"].toString();
      name = parsedJson["name"];
      parent = parsedJson["parent"].toString();
      totalProduct = parsedJson["count"];

      final image = parsedJson["image"];
      if (image != null) {
        this.image = image["src"].toString();
      } else {
        this.image = kDefaultImage;
      }

    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent": parent,
        "image": {"src": image}
      };

  Category.fromOpencartJson(Map<String, dynamic> parsedJson) {
    try {
      id = parsedJson["id"] != null ? parsedJson["id"] : '0';
      name = HtmlUnescape().convert(parsedJson["name"]);
      image = parsedJson["image"] != null ? parsedJson["image"] : kDefaultImage;
      totalProduct = parsedJson["count"] != null
          ? int.parse(parsedJson["count"].toString())
          : 0;
      parent =
          parsedJson["parent"] != null ? parsedJson["parent"].toString() : '0';
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  Category.fromMagentoJson(Map<String, dynamic> parsedJson) {
    try {
      id = "${parsedJson["id"]}";
      name = parsedJson["name"];
      image = parsedJson["image"] != null ? parsedJson["image"] : kDefaultImage;
      parent = "${parsedJson["parent_id"]}";
      totalProduct = parsedJson["product_count"];
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  Category.fromJsonShopify(Map<String, dynamic> parsedJson) {
    // printLog("fromJsonShopify id $parsedJson");

    if (parsedJson["slug"] == 'uncategorized') {
      return;
    }

    try {
      id = parsedJson["id"];
      sku = parsedJson["id"];
      name = parsedJson["title"];
      parent = '0';

      final image = parsedJson["image"];
      if (image != null) {
        this.image = image["src"].toString();
      } else {
        this.image = kDefaultImage;
      }
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  Category.fromJsonPresta(Map<String, dynamic> parsedJson, apiLink) {
    try {
      id = parsedJson["id"].toString();
      name = HtmlUnescape().convert(parsedJson["name"]);
      parent = parsedJson["id_parent"];
      image = apiLink('images/categories/$id');
      totalProduct = parsedJson['nb_products_recursive'] != null
          ? int.parse(parsedJson['nb_products_recursive'].toString())
          : null;
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  @override
  String toString() => 'Category { id: $id  name: $name}';
}
