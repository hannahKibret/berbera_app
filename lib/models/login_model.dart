import 'Vendor.dart';

class LoginResponseModel{
  bool success;
  int statusCode;
  String code;
  String message;
  Vendor data;

  LoginResponseModel({
      this.success, this.statusCode, this.code, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null? new Vendor.fromJson(json['data']):null;

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['message'] = this.message;

    if(this.data != null){
      data['data'] = this.data.toJson();
    }
    return data;
  }

}



