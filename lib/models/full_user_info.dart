
import 'package:berbera_app/models/user_meta_data.dart';

class FullUserInfo {
  int _id;
  String _dateCreated;
  String _dateCreatedGmt;
  String _dateModified;
  String _dateModifiedGmt;
  String _email;
  String _firstName;
  String _lastName;
  String _role;
  String _username;
  Billing _billing;
  Shipping _shipping;
  bool _isPayingCustomer;
  String _avatarUrl;
  List<User_meta_data> _metaData;


  int get id => _id;
  String get dateCreated => _dateCreated;
  String get dateCreatedGmt => _dateCreatedGmt;
  String get dateModified => _dateModified;
  String get dateModifiedGmt => _dateModifiedGmt;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get role => _role;
  String get username => _username;
  Billing get billing => _billing;
  Shipping get shipping => _shipping;
  bool get isPayingCustomer => _isPayingCustomer;
  String get avatarUrl => _avatarUrl;
  List<User_meta_data> get metaData => _metaData;

  FullUserInfo({
      int id, 
      String dateCreated, 
      String dateCreatedGmt, 
      String dateModified, 
      String dateModifiedGmt, 
      String email, 
      String firstName, 
      String lastName, 
      String role, 
      String username, 
      Billing billing, 
      Shipping shipping, 
      bool isPayingCustomer, 
      String avatarUrl, 
      List<User_meta_data> metaData,
      _links links}){
    _id = id;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _role = role;
    _username = username;
    _billing = billing;
    _shipping = shipping;
    _isPayingCustomer = isPayingCustomer;
    _avatarUrl = avatarUrl;
    _metaData = metaData;
}

  FullUserInfo.fromJson(dynamic json) {
    _id = json["id"];
    _dateCreated = json["date_created"];
    _dateCreatedGmt = json["date_created_gmt"];
    _dateModified = json["date_modified"];
    _dateModifiedGmt = json["date_modified_gmt"];
    _email = json["email"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _role = json["role"];
    _username = json["username"];
    _billing = json["billing"] != null ? Billing.fromJson(json["billing"]) : null;
    _shipping = json["shipping"] != null ? Shipping.fromJson(json["shipping"]) : null;
    _isPayingCustomer = json["is_paying_customer"];
    _avatarUrl = json["avatar_url"];
    if (json["meta_data"] != null) {
      _metaData = [];
      json["meta_data"].forEach((v) {
        _metaData.add(User_meta_data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["date_created"] = _dateCreated;
    map["date_created_gmt"] = _dateCreatedGmt;
    map["date_modified"] = _dateModified;
    map["date_modified_gmt"] = _dateModifiedGmt;
    map["email"] = _email;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["role"] = _role;
    map["username"] = _username;
    if (_billing != null) {
      map["billing"] = _billing.toJson();
    }
    if (_shipping != null) {
      map["shipping"] = _shipping.toJson();
    }
    map["is_paying_customer"] = _isPayingCustomer;
    map["avatar_url"] = _avatarUrl;
    if (_metaData != null) {
      map["meta_data"] = _metaData.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// self : [{"href":"https://berberamarket.com/wp-json/wc/v3/customers/3"}]
/// collection : [{"href":"https://berberamarket.com/wp-json/wc/v3/customers"}]

class _links {
  List<Self> _self;
  List<Collection> _collection;

  List<Self> get self => _self;
  List<Collection> get collection => _collection;

  _links({
      List<Self> self, 
      List<Collection> collection}){
    _self = self;
    _collection = collection;
}

  _links.fromJson(dynamic json) {
    if (json["self"] != null) {
      _self = [];
      json["self"].forEach((v) {
        _self.add(Self.fromJson(v));
      });
    }
    if (json["collection"] != null) {
      _collection = [];
      json["collection"].forEach((v) {
        _collection.add(Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_self != null) {
      map["self"] = _self.map((v) => v.toJson()).toList();
    }
    if (_collection != null) {
      map["collection"] = _collection.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Collection {
  String _href;

  String get href => _href;

  Collection({
      String href}){
    _href = href;
}

  Collection.fromJson(dynamic json) {
    _href = json["href"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["href"] = _href;
    return map;
  }

}


class Self {
  String _href;

  String get href => _href;

  Self({
      String href}){
    _href = href;
}

  Self.fromJson(dynamic json) {
    _href = json["href"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["href"] = _href;
    return map;
  }

}


class Shipping {
  String _firstName;
  String _lastName;
  String _company;
  String _address1;
  String _address2;
  String _city;
  String _postcode;
  String _country;
  String _state;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get company => _company;
  String get address1 => _address1;
  String get address2 => _address2;
  String get city => _city;
  String get postcode => _postcode;
  String get country => _country;
  String get state => _state;

  Shipping({
      String firstName, 
      String lastName, 
      String company, 
      String address1, 
      String address2, 
      String city, 
      String postcode, 
      String country, 
      String state}){
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _postcode = postcode;
    _country = country;
    _state = state;
}

  Shipping.fromJson(dynamic json) {
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _company = json["company"];
    _address1 = json["address_1"];
    _address2 = json["address_2"];
    _city = json["city"];
    _postcode = json["postcode"];
    _country = json["country"];
    _state = json["state"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["company"] = _company;
    map["address_1"] = _address1;
    map["address_2"] = _address2;
    map["city"] = _city;
    map["postcode"] = _postcode;
    map["country"] = _country;
    map["state"] = _state;
    return map;
  }

}

class Billing {
  String _firstName;
  String _lastName;
  String _company;
  String _address1;
  String _address2;
  String _city;
  String _postcode;
  String _country;
  String _state;
  String _email;
  String _phone;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get company => _company;
  String get address1 => _address1;
  String get address2 => _address2;
  String get city => _city;
  String get postcode => _postcode;
  String get country => _country;
  String get state => _state;
  String get email => _email;
  String get phone => _phone;

  Billing({
      String firstName, 
      String lastName, 
      String company, 
      String address1, 
      String address2, 
      String city, 
      String postcode, 
      String country, 
      String state, 
      String email, 
      String phone}){
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _postcode = postcode;
    _country = country;
    _state = state;
    _email = email;
    _phone = phone;
}

  Billing.fromJson(dynamic json) {
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _company = json["company"];
    _address1 = json["address_1"];
    _address2 = json["address_2"];
    _city = json["city"];
    _postcode = json["postcode"];
    _country = json["country"];
    _state = json["state"];
    _email = json["email"];
    _phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["company"] = _company;
    map["address_1"] = _address1;
    map["address_2"] = _address2;
    map["city"] = _city;
    map["postcode"] = _postcode;
    map["country"] = _country;
    map["state"] = _state;
    map["email"] = _email;
    map["phone"] = _phone;
    return map;
  }

}