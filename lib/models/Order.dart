
import 'package:berbera_app/config/general.dart';

import 'address.dart';

class Order {
  String id;
  String number;
  String status;
  DateTime createdAt;
  DateTime dateModified;
  double total;
  double totalTax;
  String paymentMethodTitle;
  String shippingMethodTitle;
  String customerNote;
  List<ProductItem> lineItems = [];
  Address billing;
  Address shipping;
  String statusUrl;
  double subtotal;
  int quantity = 0;

  Order({this.id, this.number, this.status, this.createdAt, this.total});

  Order.fromJson(Map<String, dynamic> parsedJson) {
    try {
      id = parsedJson["id"].toString();
      customerNote = parsedJson["customer_note"];
      number = parsedJson["number"];
      status = parsedJson["status"];
      createdAt = parsedJson["date_created"] != null
          ? DateTime.parse(parsedJson["date_created"])
          : DateTime.now();
      dateModified = parsedJson["date_modified"] != null
          ? DateTime.parse(parsedJson["date_modified"])
          : DateTime.now();
      total =
      parsedJson["total"] != null ? double.parse(parsedJson["total"]) : 0.0;
      totalTax = parsedJson["total_tax"] != null
          ? double.parse(parsedJson["total_tax"])
          : 0.0;
      paymentMethodTitle = parsedJson["payment_method_title"];

      parsedJson["line_items"]?.forEach((item) {
        lineItems.add(ProductItem.fromJson(item));
        quantity += int.parse("${item["quantity"]}");
      });

      billing = Address.fromJson(parsedJson["billing"]);
      shipping = Address.fromJson(parsedJson["shipping"]);
      shippingMethodTitle = parsedJson["shipping_lines"] != null &&
          parsedJson["shipping_lines"].length > 0
          ? parsedJson["shipping_lines"][0]["method_title"]
          : null;
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }


  Map<String, dynamic> toOrderJson( userId) {
    var items = lineItems.map((index) {
      return index.toJson();
    }).toList();

    return {
      "status": status,
      "total": total.toString(),
      "shipping_lines": [
        {"method_title": shippingMethodTitle}
      ],
      "number": number,
      "billing": billing,
      "line_items": items,
      "id": id,
      "date_created": createdAt.toString(),
      "payment_method_title": paymentMethodTitle
    };
  }

  Map<String, dynamic> toJson(userId, status) {
  return {
    "status": status,
  };
  }

  @override
  String toString() => 'Order { id: $id  number: $number}';
}

class ProductItem {
  String productId;
  String name;
  int quantity;
  String total;
  String featuredImage;
  String addonsOptions;
  int  variationid;

  ProductItem.fromJson(Map<String, dynamic> parsedJson) {
    try {
      productId = parsedJson["product_id"].toString();
      variationid = parsedJson["variation_id"];
      name = parsedJson["name"];
      quantity = int.parse("${parsedJson["quantity"]}");
      total = parsedJson["total"];
      featuredImage = parsedJson['featured_image'];
      if (parsedJson['featured_image'] != null) {
        featuredImage = parsedJson['featured_image'];
      }
      if (parsedJson['product_data'] != null) {
        if (parsedJson['product_data']['images'] != null &&
            parsedJson['product_data']['images'].isNotEmpty) {
          featuredImage = parsedJson['product_data']['images'][0]['src'];
        }
      }

      final metaData = parsedJson['meta_data'];
      if (metaData is List) {
        addonsOptions = metaData.map((e) => e['value']).join(', ');
      }
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }



  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "variation_id": variationid,
      "name": name,
      "quantity": quantity,
      "total": total
    };
  }

}
