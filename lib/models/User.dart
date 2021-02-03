class User{
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
      this.phone});

  User.fromJSON(Map<String, dynamic> json){
    role = json['role'];
    user_email = json['user_email'];
    user_login = json['user_login'];
    username = json['username'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    user_pass = json['user_pass'];
    email = json['email'];
    user_nicename = json['user_nicename'];
    display_name = json['display_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['role'] = role ;
    json['user_email'] = user_email;
    json['user_login'] = user_login ;
    json['username'] = username;
    json['first_name'] = first_name;
    json['last_name'] = last_name;
    json['user_pass'] = user_pass;
    json['email'] = email;
    json['user_nicename'] =  user_nicename;
    json['display_name'] = display_name;
    json['phone'] = phone;
    return json;
  }

}