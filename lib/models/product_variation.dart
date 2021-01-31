
import 'package:berbera_app/config/general.dart';
import 'product_attribute.dart';

class ProductVariation {
  String id;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String dateOnSaleFrom;
  String dateOnSaleTo;
  bool onSale;
  bool inStock;
  int stockQuantity;
  String imageFeature;
  List<Attribute> attributes = [];
  Map<String, Attribute> attributeMap = {};

  ProductVariation();

  ProductVariation.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"].toString();
    price = parsedJson["price"].toString();
    regularPrice = parsedJson["regular_price"].toString();
    salePrice = parsedJson["sale_price"].toString();
    dateOnSaleFrom = parsedJson["date_on_sale_from"];
    dateOnSaleTo = parsedJson["date_on_sale_to"];
    onSale = parsedJson["on_sale"] ?? false;
    inStock = parsedJson["in_stock"];
    inStock ? stockQuantity = parsedJson["stock_quantity"] : stockQuantity = 0;
    imageFeature = parsedJson["image"]["src"];

    List<Attribute> attributeList = [];
    parsedJson["attributes"]?.forEach((item) {
      final Attribute attribute = Attribute.fromJson(item);
      attributeList.add(attribute);
      attributeMap[attribute.name] = attribute;
    });
    attributes = attributeList;
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sku": sku,
      "price": price,
      "regularPrice": regularPrice,
      "sale_price": salePrice,
      "date_on_sale_from": dateOnSaleFrom,
      "date_on_sale_to": dateOnSaleTo,
      "on_sale": onSale,
      "in_stock": inStock,
      "stock_quantity": stockQuantity,
      "image": {"src": imageFeature},
      "attributes": attributes.map((item) {
        return item.toJson();
      }).toList()
    };
  }

  ProductVariation.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      sku = json["sku"];
      price = json['price'];
      regularPrice = json['regularPrice'];
      onSale = json['onSale'] ?? false;
      salePrice = json['salePrice'];
      dateOnSaleFrom = json["date_on_sale_from"];
      dateOnSaleTo = json["date_on_sale_to"];
      inStock = json['in_stock'];
      inStock ? stockQuantity = json["stock_quantity"] : stockQuantity = 0;
      imageFeature = json['image']["src"];
      List<Attribute> attributeList = [];

      if (json['attributes'] != null) {
        for (var item in json['attributes']) {
          final attribute = Attribute.fromLocalJson(item);
          attributeList.add(attribute);
          attributeMap[attribute.name] = attribute;
        }
      }

      attributes = attributeList;
    } catch (e) {
      printLog(e.toString());
    }
  }


  /// Get product ID from mix String productID-ProductVariantID
  static String cleanProductVariantID(productString) {
    return productString.contains('-') ? productString.split('-')[1] : null;
  }

  /// Return true if [attributeMap] includes [attributes]
  bool hasSameAttributes(Map<String, String> attributes) {
    bool isSame = true;
    final keys = attributes.keys.toList(growable: false);
    final values = attributes.values.toList(growable: false);
    for (var i = 0; i < attributes.length; i++) {
      if (attributeMap[keys[i]] == null || values[i] == null) {
        /// In case this attribute can be any option, don't need to check.
        continue;
      }
      if (attributeMap[keys[i]].option != values[i]) {
        return isSame = false;
      }
    }
    return isSame;
  }
}
