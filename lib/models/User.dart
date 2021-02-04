class User{
  int id;
  String role;
  String user_email;
  String user_login;
  String username;
  String first_name;
  String last_name;
  String user_pass;
  String email;
  String user_nicename;
  String display_name;
  String store_name;
  List<Map<String,dynamic>> meta_data;
  
  String phone;

  User({
      this.role,
      this.user_email,
      this.user_login,
      this.username,
      this.first_name,
      this.last_name,
      this.user_pass,
      this.email,
      this.user_nicename,
      this.display_name,
      this.phone,
      this.meta_data});

  User.fromJSON(Map<String, dynamic> json){
    role = json['role'];
    user_email = json['user_email'];
    user_login = json['user_login'];
    user_pass = json['user_pass'];
    username = json['username'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    user_pass = json['user_pass'];
    email = json['email'];
    user_nicename = json['user_nicename'];
    display_name = json['display_name'];
    phone = json['phone'];
    meta_data = json['meta_data'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['role'] = this.role ;
    json['user_email'] = this.user_email;
    json['user_login'] = this.user_login ;
    json['username'] = this.username;
    json['password'] = this.user_pass;
    json['first_name'] = this.first_name;
    json['last_name'] = this.last_name;
    json['user_pass'] = this.user_pass;
    json['email'] = this.email;
    json['user_nicename'] =  this.user_nicename;
    json['display_name'] = this.display_name;
    json['phone'] = this.phone;
    json['meta_data'] = this.meta_data;
    return json;
  }


}

class Value{
  String phone;
  String store_name;

  Value({
    this.phone,
    this.store_name
    });

   Value.fromJSON(Map<String, dynamic> json){
    phone = json['phone'];
    store_name = json['store_name'];
   

    }

    Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['phone'] = this.phone;
    json['store_name'] = this.store_name;
  
    return json;
  }

    


  
}
