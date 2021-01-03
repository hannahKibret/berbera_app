class Product {

  String id;
  String name;
  String sku;
  String post_author;
  String type;
  String status;
  String featured;
  String description;
  String short_description;
  String regular_price;
  String sale_price;
  String price;
  String sold_individually;
  String stock_quantity;
  String low_stock_amount;
  String total_sales;
  Product_ImageURL images;
  Product_Attributes attributes;

  Product({
      this.id,
      this.name,
      this.sku,
      this.post_author,
      this.type,
      this.status,
      this.featured,
      this.description,
      this.short_description,
      this.regular_price,
      this.sale_price,
      this.price,
      this.sold_individually,
      this.stock_quantity,
      this.low_stock_amount,
      this.total_sales,
      this.images,
      this.attributes});

Product.fromJSON(Map<String, dynamic> json){
  id = json['id'];
  name = json['name'];
  sku = json['sku'];
  post_author = json['post_author'];
  type = json['type'];
  status = json['status'];
  featured = json['featured'];
  description = json['description'];
  short_description = json['short_description'];
  regular_price = json['regular_price'];
  sale_price = json['sale_price'];
  price = json['price'];
  sold_individually = json['sold_individually'];
  stock_quantity = json['stock_quantity'];
  low_stock_amount = json['low_stock_amount'];
  total_sales = json['total_sales'];
  images = Product_ImageURL.fromJSON(json['images']);
  attributes = Product_Attributes.fromJSON(json['attributes']);
}

Map<String, dynamic> toJSON(){
  final Map<String, dynamic> json = new Map<String, dynamic>();

  //json['total_sales'] = this.total_sales;
  //json['price'] = this.price
  //json['sold_individually'] = this.sold_individually;
  // json['featured'] = this
  json['id'] = this.id;
  json['name'] = this.name;
  json['sku'] = this.sku;
  json['post_author'] = this.post_author;
  json['type'] = this.type;
  json['status'] = this.status;
  json['description'] = this.description;
  json['short_description'] = this.short_description;
  json['regular_price'] = this.regular_price;
  json['sale_price'] = this.sale_price;
  json['stock_quantity'] = this.stock_quantity;
  json['low_stock_amount'] = this.low_stock_amount;
  json['images'] = this.images.toJSON;
  json['attributes'] = this.attributes.toJSON;

  return json;
}
}

class Product_Attributes {
 String id;
 String name;
 List<String> options;

 Product_Attributes({this.id, this.name, this.options});

Product_Attributes.fromJSON(Map<String, dynamic> json) {
   id =  json['id'];
   name = json['name'];
   options = json['options'];
  }
  Map<String, dynamic> toJSON(){
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['name'] = this.name;
    json['options'] = this.options;
return json;
  }
}

class Product_ImageURL {
  String id;
  String src_url;

  Product_ImageURL({this.id, this.src_url});

  Product_ImageURL.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    src_url = json['src'];
  }

  Map<String, dynamic> toJSON(){
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['src'] = this.src_url;
    return json;
  }

}