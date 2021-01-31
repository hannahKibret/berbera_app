import 'package:berbera_app/config/general.dart';
import 'package:berbera_app/config/strings.dart';
import 'package:flutter/material.dart';

class StoreModel with ChangeNotifier {
//  final Services _service = Services();
  final String langCode;

  StoreModel({
    this.langCode = '',
  });

  List<Store> _stores;
  List<Store> lstFeaturedStores;
  bool isLoading = true;
  String message;
  int _currentPage = 0;
  String _currentNameSearch = '';
  bool _isEnd = false;

  bool get isEnd => _isEnd;

  List<Store> get stores => _stores;

}

class Store {
  var id;
  String name;
  String email;
  double rating;
  String image;
  String address;
  String banner;
  String phone;
  String website;
  bool isFeatured;
  double lat;
  double long;
  Map<String, String> socials;


  Store.fromWCFMJson(Map<String, dynamic> parsedJson) {
    //TODO: added to string
    id = parsedJson["vendor_id"].toString();
    name = parsedJson["vendor_shop_name"];
    email = parsedJson["vendor_email"];
    rating = 0.0;
    address = parsedJson["vendor_address"];
    if (parsedJson["settings"] != null && parsedJson["settings"] is Map) {
      image = parsedJson["settings"]["gravatar"].toString().isNotEmpty &&
          parsedJson["settings"]["gravatar"].toString().contains("http")
          ? parsedJson["settings"]["gravatar"]
          : null;
      banner = parsedJson["settings"]["mobile_banner"].toString().isNotEmpty &&
          parsedJson["settings"]["mobile_banner"].toString().contains("http")
          ? parsedJson["settings"]["mobile_banner"]
          : null;
      if(isBlank(banner)){
        banner = parsedJson["settings"]["banner"].toString().isNotEmpty &&
            parsedJson["settings"]["banner"].toString().contains("http")
            ? parsedJson["settings"]["banner"]
            : null;
      }
      if(isBlank(banner)){
        banner = parsedJson['mobile_banner'] ??
            parsedJson['vendor_banner'] ??
            parsedJson['vendor_list_banner'];
      }
      if(isBlank(image)){
        image = parsedJson['vendor_shop_logo'];
      }
      try {
        lat = double.parse(parsedJson["settings"]['store_lat']);
        long = double.parse(parsedJson["settings"]['store_lng']);
      } catch (e) {
        lat = null;
        long = null;
      }

      phone = "";
      if (parsedJson["settings"]["phone"] is List) {
        if (parsedJson["settings"]["phone"].isNotEmpty) {
          phone = parsedJson["settings"]["phone"][0];
        }
      }
      if (parsedJson["settings"]["phone"] is String) {
        phone = parsedJson["settings"]["phone"];
      }
      final _socials = parsedJson["settings"]["social"];
      if (_socials != null && _socials is Map) {
        socials = Map<String, String>.from(_socials);
        if (socials["fb"] != null) {
          socials["facebook"] = "${socials["fb"]}";
          socials.remove("fb");
        }
      }
    } else {
      banner = parsedJson['mobile_banner'] ??
          parsedJson['vendor_shop_logo'] ??
          parsedJson['vendor_banner'] ??
          parsedJson['vendor_list_banner'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      //TODO: added tostring
      "id": id.toString(),
      "name": name,
      "email": email,
      "rating": rating,
      "image": image,
      "address": address,
      "banner": banner,
      "phone": phone,
      "website": website
    };
  }

  Store.fromLocalJson(Map<String, dynamic> json) {
    try {
      //TODO check here
      id = json['id'];
      name = json['name'];
      email = json['email'];
      rating = json['rating'];
      image = json['image'];
      address = json['address'];
      banner = json['banner'];
      phone = json['phone'];
      website = json['website'];
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }
}
