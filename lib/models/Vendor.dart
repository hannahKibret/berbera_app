class Vendor{
  String token;
  int store_id;
  String email;
  String niceName;
  String display_name;
  String store_name;

  Vendor({this.email, this.token, this.store_id, this.niceName,this.store_name,
    this.display_name});

  Vendor.fromJson(Map<String, dynamic> json){
    token = json['token'];
    store_id = json['store_id'];
    email = json['user_email'];
    niceName = json['user_nicename'];
    store_name = json['store_name'];
    display_name = json['user_display_name'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['store_id'] = this.store_id;
    data['user_email'] = this.email;
    data['user_display_name'] = this.display_name;
    data['store_name'] = this.store_name;
    data['user_nicename'] = this.niceName;

    return data;
  }

}