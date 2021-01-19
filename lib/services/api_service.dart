import 'dart:convert';
import 'dart:io';

import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/models/Notification.dart';
import 'package:berbera_app/models/Order.dart';
import 'package:berbera_app/models/Product.dart';
import 'package:berbera_app/models/User.dart';
import 'package:berbera_app/models/Vendor.dart';
import 'package:berbera_app/models/login_model.dart';
import 'package:dio/dio.dart';

class APIService {

  var authToken = base64.encode(
    utf8.encode(Config.key + ":" + Config.secrete),
  );

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
      if (response.statusCode == 201) {
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


  Future<List<Product>> getProducts(String id) async {
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
          Iterable l = json.decode(response.data);
          List<Product> products = List<Product>.from(
              l.map((model) => Notification.fromJSON(model)));
          return products;
        }
      } on DioError catch (e) {}
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
              l.map((model) => Notification.fromJSON(model)));
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
                data: product.toJSON(),
                options: new Options(headers: {
                  HttpHeaders.contentTypeHeader:
                      "application/x-www-from-urlencoded",
                  HttpHeaders.authorizationHeader:
                      "Bearer ${Config.token}"
                }));
        if (response.statusCode == 200) {
          Product updated_product = new Product();
          updated_product = Product.fromJSON(response.data);
          return updated_product;
        }
      } on DioError catch (e) {}
    } else {
      try {
        var response = await Dio().post(Config.wcfmURL + Config.products,
            data: product.toJSON(),
            options: new Options(headers: {
              HttpHeaders.contentTypeHeader:
                  "application/x-www-from-urlencoded",
              HttpHeaders.authorizationHeader:
                  "Bearer ${Config.token}"
            }));
        if (response.statusCode == 200) {
          Product updated_product = new Product();
          updated_product = Product.fromJSON(response.data);
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
        deleted_product = Product.fromJSON(response.data);
        return deleted_product;
      }
    } on DioError catch (e) {}
  }

  Future<List<Order>> getOrders(String id) async {
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
          Iterable l = json.decode(response.data);
          List<Order> Orders =
              List<Order>.from(l.map((model) => Notification.fromJSON(model)));
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
          Iterable l = json.decode(response.data);
          List<Order> orders =
              List<Order>.from(l.map((model) => Notification.fromJSON(model)));
          return orders;
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
        order = Order.fromJSON(response.data);
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
          Iterable l = json.decode(response.data);
          List<Notification> Notifications = List<Notification>.from(
              l.map((model) => Notification.fromJSON(model)));
          return Notifications;
        }
      } on DioError catch (e) {}
    } else {
      try {
        var response =
            await Dio().get(Config.wcfmURL + Config.notifications + id,
                options: new Options(headers: {
                  HttpHeaders.contentTypeHeader:
                      "application/x-www-from-urlencoded",
                  HttpHeaders.authorizationHeader:
                      "Bearer ${Config.token}"
                }));
        if (response.statusCode == 200) {
          Iterable l = json.decode(response.data);
          List<Notification> notifications = List<Notification>.from(
              l.map((model) => Notification.fromJSON(model)));
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
}
