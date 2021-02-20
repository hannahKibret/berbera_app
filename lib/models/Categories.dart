import 'package:berbera_app/models/Product.dart';

class Categories {
  String id;
  String name;
  String slug;
  String parent;
  String description;
 // Product_ImageURL image;

  Categories(
      this.id, this.name, this.slug, this.parent, this.description,
     // this.image
      );

  Categories.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
   // image = Product_ImageURL.fromJSON(json['image']);
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['name'] = this.name;
    json['slug'] = this.slug;
    json['parent'] = this.parent;
    json['description'] = this.description;
    //json['image'] = this.image.toJSON();

    return json;
  }
}
