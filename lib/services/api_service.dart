
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/config/general.dart';
import 'package:berbera_app/models/Notification.dart';
import 'package:berbera_app/models/Order.dart';
import 'package:berbera_app/models/Review.dart';
import 'package:berbera_app/models/full_user_info.dart';
import 'package:berbera_app/models/product.dart';
import 'package:berbera_app/models/User.dart';
import 'package:berbera_app/models/Vendor.dart';
import 'package:berbera_app/models/category.dart';
import 'package:berbera_app/models/login_model.dart';
import 'package:berbera_app/models/product_attribute.dart';
import 'package:dio/dio.dart';

class APIService {

  var authToken = base64.encode(
    utf8.encode(Config.key + ":" + Config.secrete),
  );

  Future<List<Category>> getcategories() async{
try{
  List<Category> _categories =[];
  var response = await Dio().get(Config.wp_URL + Config.categories,
      options: new Options(headers: {
        HttpHeaders.contentTypeHeader:
        "application/x-www-from-urlencoded",
        HttpHeaders.authorizationHeader:
        "Bearer ${Config.token}"
      }));
  if (response.statusCode == 200) {
    for(int i = 0; i < response.data.length; i++){
      _categories.add(Category.fromJson(response.data[i]));
    }
    printLog("cate return");
    return  _categories;
  }
}catch(e){
print(e.toString());
}
  }

  Future<List<Attribute>> getAttribute(String id) async {
    try{
      printLog("att get");
      List<Attribute> _attributes =[];
      var response = await Dio().get(Config.wp_URL+Config.attributes +"$id/terms?per_page=100&",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader:
            "application/x-www-from-urlencoded",
            HttpHeaders.authorizationHeader:
           "Bearer ${Config.token}"
          }));
      if (response.statusCode == 200) {
        for(int i = 0; i < response.data.length; i++){
          _attributes.add(Attribute.fromJson(response.data[i]));
        }
        printLog("attr return");
        return  _attributes;
      }
    }catch(e){
      print(e.toString());
    }
  }


  Future<bool> createUser(User user) async {

    bool ret = false;
    try {
      var response = await Dio().post('https://berberamarket.com/wp-json/api/flutter_user/register',
          //TODO: Pass user data here
          data:  user.toJSON(),
          options: new Options(headers: {
          //  HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));

      if (response.statusCode == 200) {
        //await loginUser(user.email, user.user_pass);

        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }


  Future<User> editUser(String id, User user) async{
    try{
      var response = await Dio().post(Config.wp_URL + Config.userURL + id,
          data: user.toJSON(),
      options: new Options(headers: {
        HttpHeaders.contentTypeHeader:
        "application/x-www-from-urlencoded",
        HttpHeaders.authorizationHeader: 'Basic $authToken',
      }));

      return User.fromJSON(response.data);

    }catch (e){

    }
  }


  Future<List<Product>> getProducts({String id}) async {
    if (id == null) {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.products,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {

          print(response.data);

          List<Product> products = [];

          for(int i = 0; i < response.data.length; i++){
            products.add(Product.fromJson(response.data[i]));
          }

          print(products.length);
          // var dt = response.data.toString();
          // Iterable l ;
          // List<Product> products = List<Product>.from(
          //     l.map((model) => Product.fromJson(model)));
          // print('url${Config.wcfmURL}${Config.products}/ token ${Config.token}');
          // print('data received====${products.length}');
           return products;
        }
      } on DioError catch (e) {
        print(e);
      }
    } else {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.products + id,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          Iterable l = json.decode(response.data);
          List<Product> products = List<Product>.from(
              l.map((model) => Product.fromJson(model)));

          return products;
        }
      } on DioError catch (e) {}
    }
  }

  Future<Product> update_create_Prodcut(Product product, String id) async {
    if (id == null) {
      try {
        var response =
            await Dio().put(Config.wcfmURL + Config.products + product.id,
                data: product.toJson(),
                options: new Options(headers: {
                  HttpHeaders.contentTypeHeader:
                      "application/x-www-from-urlencoded",
                  HttpHeaders.authorizationHeader:
                      "Bearer ${Config.token}"
                }));
        if (response.statusCode == 200) {
          Product updated_product = new Product();
          updated_product = Product.fromJson(response.data);
          return updated_product;
        }
      } on DioError catch (e) {}
    } else {
      try {
        var response = await Dio().post(Config.wcfmURL + Config.products,
            data: product.toJson(),
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          Product updated_product = new Product();
          updated_product = Product.fromJson(response.data);
          return updated_product;
        }
      } on DioError catch (e) {}
    }
  }

  Future<Product> deleteProdcut(String id) async {
    try {
      var response = await Dio().delete(Config.wcfmURL + Config.products + id,
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-from-urlencoded",
            HttpHeaders.authorizationHeader:
                "Bearer ${Config.token}"
          }));
      if (response.statusCode == 200) {
        Product deleted_product = new Product();
        deleted_product =  Product.fromJson(response.data);
        return deleted_product;
      }
    } on DioError catch (e) {}
  }

  Future getOrders({String id}) async {
    if (id == null) {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.orders,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          List<Order> Orders = [];
          for(int i = 0; i < response.data.length; i++){
            Orders.add(Order.fromJson(response.data[i]));
          }
          return Orders;
        }
      } on DioError catch (e) {}
    } else {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.orders + id,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          return Order.fromJson(response.data);
        }
      } on DioError catch (e) {}
    }
  }

  Future<List<Order>> getPendingOrders({String id}) async {
    if (id == null) {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.orders,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
              "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
              "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          List<Order> Orders = [];
          for(int i = 0; i < response.data.length; i++){
            if(Order.fromJson(response.data[i]).status == 'processing'){
              Orders.add(Order.fromJson(response.data[i]));
            }
          }
          return Orders;
        }
      } on DioError catch (e) {}
    } else {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.orders + id,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
              "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
              "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          List<Order> Orders = [];
          for(int i = 0; i < response.data.length; i++){
            Orders.add(Order.fromJson(response.data[i]));
          }
          return Orders;
        }
      } on DioError catch (e) {}
    }
  }

  Future<Order> updateOrder(String status, String id) async {
    try {
      var response = await Dio().put(Config.wcfmURL + Config.orders + id,
          data: {"status": "status"},
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-from-urlencoded",
            HttpHeaders.authorizationHeader:
                "Bearer ${Config.token}"
          }));
      if (response.statusCode == 200) {
        Order order = new Order();
        order = Order.fromJson(response.data);
        return order;
      }
    } on DioError catch (e) {}
  }

  Future<List<Notification>> getNotifications({String id}) async {
    if (id == null) {
      try {
        var response = await Dio().get(Config.wcfmURL + Config.notifications,
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          List<Notification> Notifications = [];
          for(int i = 0; i < response.data.length; i++){
            Notifications.add(Notification.fromJSON(response.data[i]));
          }
          return Notifications;
        }



      } on DioError catch (e) {}
    } else {
      try {
        var response =
            await Dio().delete(Config.wcfmURL + Config.notifications + id,
                options: new Options(headers: {
                  HttpHeaders.contentTypeHeader:
                      "application/x-www-from-urlencoded",
                  HttpHeaders.authorizationHeader:
                      "Bearer ${Config.token}"
                }));
        if (response.statusCode == 200) {
          List<Notification> notifications = [];
          var k = [];

          for(int i = 0; i< response.data.length; i++){
            k.add(json.decode(response.data[i]));


          }
          for(int j = 0; j < k.length; j++){
            notifications.add(Notification.fromJSON(k[j]));
          }

          print(notifications);

          return notifications;
        }
      } on DioError catch (e) {}
    }
  }

  Future<LoginResponseModel> loginUser(String username, String password) async {
    try {
      var response = await Dio().post(Config.tokenURL,
          data: {
            "username": username,
            "password": password,
          },
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-from-urlencoded",
          }));

      if (response.statusCode == 200) {
        LoginResponseModel user = new LoginResponseModel();
        Vendor user_data = Vendor.fromJson(response.data);
        Config.token = user_data.token;
        Config.displayname = user_data.display_name;
        Config.store_name = user_data.store_name;
        Config.image_url = user_data.image_url;
        Config.email = user_data.email;
        Config.storeid = user_data.store_id.toString();
        // print(user_data.token);
        user.data = user_data;
        user.statusCode = response.statusCode;
        return user;
      }
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }
  Future<List<Review>> getReviews(String id) async {
    try {
      print('config${Config.token}');
      var response = await Dio().get(Config.wcfmURL + Config.review,

          options: new Options(headers: {
            HttpHeaders.contentTypeHeader:
            "application/x-www-from-urlencoded",
            // HttpHeaders.authorizationHeader:
            //     "Bearer ${Config.token}"
          }));
      print('yayeeee');
      if (response.statusCode == 200) {
        print('yaeee2');
        List<Review> reviews = [];
        for(int i = 0; i < response.data.length; i++){

          if(response.data[i]['vendor_id'] == id){
            reviews.add(Review.fromJSON(response.data[i]));
          }
        }

        return reviews;
      }
    } on DioError catch (e) {print('nnnn: ${e.response}');}
  }

  Future<FullUserInfo> get_full_user_data() async {
    try {
      print("getting user full info");
      print('config${Config.token}');
      var response = await Dio().get(Config.wp_URL + Config.userURL +"/${Config.storeid}",

          options: new Options(headers: {
            HttpHeaders.contentTypeHeader:
            "application/x-www-from-urlencoded",
            HttpHeaders.authorizationHeader:
            "Bearer ${Config.token}"
          }));
      if (response.statusCode == 200) {
        FullUserInfo userInfo;
        userInfo = FullUserInfo.fromJson(response.data);
        print(userInfo.email);
        return userInfo;
      }
    } on DioError catch (e) {print(e.toString());}
  }

}
