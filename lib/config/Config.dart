import 'package:berbera_app/models/full_user_info.dart';

class Config {
  static String key = "ck_f55dab1236058926dac85af3fd4c5e525a4483b9";
  static String secrete = "cs_86df0bc2bc8d60f549f453c1c489efeb7d4536c6";
  static String url = "https://berberamarket.com/";
  static String wp_URL = "https://berberamarket.com/wp-json/wc/v3/";
  static String attributes = "products/attributes/";
  static String userURL = "customers";
  static String wcfmURL = "https://berberamarket.com/wp-json/wcfmmp/v1/";
  static String imageURL = 'https://berberamarket.com/wp-content/uploads/2021/02/';
  static String orders = "orders/";
  static String products = "products/"; 
  static String review = "reviews/";
  static String filter = "products/filter/";
  static String categories = "products/categories/";
  static String notifications = "notifications/";
  static String restricted_capabilities = "restricted-capabilities/";
  static String tokenURL = "https://www.berberamarket.com/wp-json/jwt-auth/v1/token";
  static String token;
  static String displayname;
  static String email;
  static String kDefaultImage = "https://trello-attachments.s3.amazonaws.com/5d64f19a7cd71013a9a418cf/640x480/1dfc14f78ab0dbb3de0e62ae7ebded0c/placeholder.jpg";
  static String firstname;
  static String lastname;
  static String store_name;
  static String image_url;
  static String storeid;
  static bool isOffline = false;
  static FullUserInfo userInfo;
  static List<String> ids= [];
  static List<Map<String,bool>> catMaps = [];
}
