import 'package:berbera_app/config/general.dart';
import 'package:berbera_app/config/strings.dart';
import 'ProductAddon.dart';
import 'Store.dart';
import 'Tag.dart';
import 'category.dart';
import 'product_attribute.dart';
import 'product_variation.dart';

class Product {
  //TODO: changed to int
  String id;
  String sku;
  String name;
  String vendor;
  String description;
  String shortDescription;
  String permalink;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool inStock;
  double averageRating;
  int totalSales;
  String dateOnSaleFrom;
  String dateOnSaleTo;
  int ratingCount;
  List<String> images;
  String imageFeature;
  List<ProductAttribute> attributes;
  Map<String, String> attributeSlugMap = {};
  List<Attribute> defaultAttributes;
  List<ProductAttribute> infors = [];
  String categoryId;
  String videoUrl;
  List<dynamic> groupedProducts;
  List<String> files;
  int stockQuantity;
  int minQuantity;
  int maxQuantity;
  bool manageStock = false;
  bool backOrdered = false;
  Store store;
  List<Tag> tags = [];
  Map<String, Map<String, AddonsOption>> defaultAddonsOptions = {};
  List<Category> categories = [];

  List<ProductAddons> addOns;
  List<AddonsOption> selectedOptions;

  /// For downloadable products
  bool isPurchased = false;
  bool isDownloadable = false;

  /// is to check the type affiliate, simple, variant
  String type;
  String affiliateUrl;
  List<ProductVariation> variations;
  List<Map<String, dynamic>> options; //for opencart

  String idShop; //for prestashop

  bool isFeatured = false;
  String vendorAdminImageFeature;
  List<String> categoryIds = [];

  Product.empty(this.id) {
    name = '';
    price = '0.0';
    imageFeature = '';
  }

  bool isEmptyProduct() {
    return name == '' && price == '0.0' && imageFeature == '';
  }

  Product();

  Product.copyWith(Product p) {
    id = p.id;
    sku = p.sku;
    name = p.name;
    description = p.description;
    permalink = p.permalink;
    price = p.price;
    regularPrice = p.regularPrice;
    salePrice = p.salePrice;
    onSale = p.onSale;
    inStock = p.inStock;
    averageRating = p.averageRating;
    ratingCount = p.ratingCount;
    totalSales = p.totalSales;
    dateOnSaleFrom = p.dateOnSaleFrom;
    dateOnSaleTo = p.dateOnSaleTo;
    images = p.images;
    imageFeature = p.imageFeature;
    attributes = p.attributes;
    infors = p.infors;
    categoryId = p.categoryId;
    videoUrl = p.videoUrl;
    groupedProducts = p.groupedProducts;
    files = p.files;
    stockQuantity = p.stockQuantity;
    minQuantity = p.minQuantity;
    maxQuantity = p.maxQuantity;
    manageStock = p.manageStock;
    backOrdered = p.backOrdered;
    type = p.type;
    affiliateUrl = p.affiliateUrl;
    variations = p.variations;
    options = p.options;
    idShop = p.idShop;
    shortDescription = p.shortDescription;
    tags = p.tags;
    defaultAddonsOptions = p.defaultAddonsOptions;
    selectedOptions = p.selectedOptions;
    addOns = p.addOns;
  }

  Product.fromJson(Map<String, dynamic> parsedJson) {
    try {
      id = parsedJson["id"].toString();
      sku = parsedJson["sku"];
      name = parsedJson["name"];
      type = parsedJson["type"];
      description = isNotBlank(parsedJson["description"])
          ? parsedJson["description"]
          : parsedJson["short_description"];
      shortDescription = parsedJson["short_description"];
      permalink = parsedJson["permalink"];
      price = parsedJson["price"] != null ? parsedJson["price"].toString() : "";

      regularPrice = parsedJson["regular_price"] != null
          ? parsedJson["regular_price"].toString()
          : null;
      salePrice = parsedJson["sale_price"] != null
          ? parsedJson["sale_price"].toString()
          : null;

      if (type == 'variable') {
        onSale = parsedJson["on_sale"];
      } else {
        onSale = parsedJson["price"] != parsedJson["regular_price"] &&
            isNotBlank(parsedJson["price"]) &&
            isNotBlank(parsedJson["regular_price"]) &&
            double.parse(parsedJson["regular_price"]) >
                double.parse(parsedJson["price"]);
      }

      inStock =
          parsedJson["in_stock"] ?? parsedJson["stock_status"] == "instock";
      backOrdered = parsedJson["backordered"] ?? false;

      averageRating =
          double.tryParse(parsedJson["average_rating"]?.toString() ?? "0.0") ??
              0.0;
      ratingCount =
          int.tryParse((parsedJson["rating_count"] ?? 0).toString()) ?? 0;
      totalSales =
          int.tryParse((parsedJson["total_sales"] ?? 0).toString()) ?? 0;
      dateOnSaleFrom = parsedJson["date_on_sale_from"];
      dateOnSaleTo = parsedJson["date_on_sale_to"];
      categoryId = parsedJson["categories"] != null &&
              parsedJson["categories"].length > 0
          ? parsedJson["categories"][0]["id"].toString()
          : '0';

      manageStock = parsedJson['manage_stock'] ?? false;

      isPurchased = parsedJson['is_purchased'] ?? false;
      isDownloadable = parsedJson['downloadable'];
      // add stock limit
      if (parsedJson['manage_stock'] == true) {
        stockQuantity = parsedJson['stock_quantity'];
      }

      //minQuantity = parsedJson['meta_data']['']

      if (parsedJson["attributes"] is List) {
        parsedJson["attributes"]?.forEach((item) {
          if (item['visible'] ?? true) {
            infors.add(ProductAttribute.fromLocalJson(item));
          }
        });
      }

      List<ProductAttribute> attributeList = [];

      /// Not check the Visible Flag from variant
      bool notChecking = kNotStrictVisibleVariant ?? true;

      parsedJson["attributesData"]?.forEach((item) {
        if (!notChecking) {
          notChecking = item['visible'];
        }

        if (notChecking && item['variation']) {
          final ProductAttribute attr = ProductAttribute.fromJson(item);
          attributeList.add(attr);

          /// Custom attributes not appeared in ["attributesData"].
          if (attr.options.isEmpty) {
            /// Need to take from ["attributes"].
            /// we should compare productAttribute.name == attr.name as the id sometime is 0
            attr.options.addAll(
              infors
                      .firstWhere(
                          (ProductAttribute productAttribute) =>
                              productAttribute?.name != null &&
                              attr?.name != null &&
                              (productAttribute.name == attr.name ||
                                  productAttribute.name.toLowerCase() ==
                                      attr.name.toLowerCase()),
                          orElse: () => null)
                      ?.options
                      ?.map((option) => {"name": option}) ??
                  [],
            );
          }

          for (var option in attr?.options) {
            if (option['slug'] != null && option['slug'] != "") {
              attributeSlugMap[option['slug']] = option['name'];
            }
          }
        }
      });
      attributes = attributeList.toList();

      List<Attribute> _defaultAttributes = [];
      parsedJson["default_attributes"]?.forEach((item) {
        _defaultAttributes.add(Attribute.fromJson(item));
      });
      defaultAttributes = _defaultAttributes.toList();

      List<String> list = [];
      if (parsedJson["images"] != null) {
        for (var item in parsedJson["images"]) {
          /// If item is String => Use for Vendor Admin.
          if (item is String) {
            list.add(item);
          }

          if (item is Map) {
            list.add(item["src"]);
          }
        }
      }

      images = list;
      imageFeature = images.isNotEmpty ? images[0] : null;

      try {
        final _tags = parsedJson['tags'];
        if (_tags != null && _tags is List && _tags.isNotEmpty) {
          for (var tag in _tags) {
            tags.add(Tag.fromJson(tag));
          }
        }
      } catch (_) {
        // ignore
      }

      try {
        final _categories = parsedJson['categories'];
        if (_categories != null &&
            _categories is List &&
            _categories.isNotEmpty) {
          for (var category in _categories) {
            categories.add(Category.fromJson(category));
          }
        }
      } catch (_) {
        // ignore
      }

      ///------For Vendor Admin------///
      if (parsedJson['featured_image'] != null) {
        vendorAdminImageFeature = parsedJson['featured_image'];
      }

      if (parsedJson['featured'] != null) {
        isFeatured = parsedJson['featured'];
      }
      if (parsedJson['category_ids'] != null) {
        for (var item in parsedJson['category_ids']) {
          categoryIds.add(item.toString());
        }
      }

      ///------For Vendor Admin------///

      /// get video links, support following plugins
      /// - WooFeature Video: https://wordpress.org/plugins/woo-featured-video/
      ///- Yith Feature Video: https://wordpress.org/plugins/yith-woocommerce-featured-video/
      var video = parsedJson['meta_data'].firstWhere(
        (item) =>
            item['key'] == '_video_url' || item['key'] == '_woofv_video_embed',
        orElse: () => null,
      );
      if (video != null) {
        videoUrl = video['value'] is String
            ? video['value']
            : video['value']['url'] ?? '';
      }

      affiliateUrl = parsedJson['external_url'];

      List<int> groupedProductList = [];
      parsedJson['grouped_products']?.forEach((item) {
        groupedProductList.add(item);
      });
      groupedProducts = groupedProductList;
      List<String> files = [];
      parsedJson['downloads']?.forEach((item) {
        files.add(item['file']);
      });
      this.files = files;

      if (parsedJson['meta_data'] != null) {
        for (var item in parsedJson['meta_data']) {
          try {
            if (item['key'] == '_minmax_product_max_quantity') {
              int quantity = int.parse(item['value']);
              quantity == 0 ? maxQuantity = null : maxQuantity = quantity;
            }
          } catch (e) {
            printLog('maxQuantity $e');
          }

          try {
            if (item['key'] == '_minmax_product_min_quantity') {
              int quantity = int.parse(item['value']);
              quantity == 0 ? minQuantity = null : minQuantity = quantity;
            }
          } catch (e) {
            printLog('minQuantity $e');
          }

          try {
            if (item['key'] == '_product_addons') {
              final List<dynamic> values = item['value'] ?? [];
              addOns = List.generate(
                values.length,
                (index) {
                  final ProductAddons _item =
                      ProductAddons.fromJson(values[index]);
                  defaultAddonsOptions[_item.name] = _item.defaultOptions;
                  return _item;
                },
              );
            }
          } catch (e) {
            printLog('_product_addons $e');
          }
        }
      }
    } catch (e, trace) {
      printLog(trace);
      printLog(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sku": sku,
      "name": name,
      "description": description,
      "permalink": permalink,
      "price": price,
      "regularPrice": regularPrice,
      "salePrice": salePrice,
      "onSale": onSale,
      "inStock": inStock,
      "averageRating": averageRating,
      "ratingCount": ratingCount,
      "total_sales": totalSales,
      "date_on_sale_from": dateOnSaleFrom,
      "date_on_sale_to": dateOnSaleTo,
      "images": images,
      "imageFeature": imageFeature,
      "attributes": attributes?.map((e) => e.toJson())?.toList(),
      "addOns": addOns?.map((e) => e.toJson())?.toList(),
      "addonsOptions": selectedOptions?.map((e) => e.toJson())?.toList(),
      "categoryId": categoryId,
      "stock_quantity": stockQuantity,
      "idShop": idShop,
      "store": store?.toJson(),
      "variations": variations?.map((e) => e?.toJson())?.toList(),
    };
  }

  Product.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      sku = json['sku'];
      name = json['name'];
      description = json['description'];
      permalink = json['permalink'];
      price = json['price'];
      regularPrice = json['regularPrice'];
      salePrice = json['salePrice'];
      onSale = json['onSale'] ?? false;
      inStock = json['inStock'];
      averageRating = json['averageRating'];
      ratingCount = json['ratingCount'];
      totalSales = json['total_sales'];
      dateOnSaleFrom = json["date_on_sale_from"];
      dateOnSaleTo = json["date_on_sale_to"];
      idShop = json['idShop'];
      List<String> imgs = [];

      if (json['images'] != null) {
        for (var item in json['images']) {
          imgs.add(item);
        }
      }
      images = imgs;
      imageFeature = json['imageFeature'];
      List<ProductAttribute> attrs = [];

      if (json['attributes'] != null) {
        for (var item in json['attributes']) {
          attrs.add(ProductAttribute.fromLocalJson(item));
        }
      }

      if (json['addOns'] != null) {
        List<ProductAddons> _addOns = [];
        for (var item in json['addOns']) {
          _addOns.add(ProductAddons.fromJson(item));
        }
        addOns = _addOns;
      }

      if (json['addonsOptions'] != null) {
        List<AddonsOption> _options = [];
        for (var item in json['addonsOptions']) {
          _options.add(AddonsOption.fromJson(item));
        }
        selectedOptions = _options;
      }

      attributes = attrs;
      categoryId = "${json['categoryId']}";
      stockQuantity = json['stock_quantity'];
      if (json['store'] != null) {
        store = Store.fromLocalJson(json['store']);
      }
      isPurchased = json['isPurchased'] ?? false;
      isDownloadable = json['isDownloadable'] ?? false;
      variations = List.from(json['variations'] ?? [])
          .map((variantJson) => ProductVariation.fromLocalJson(variantJson))
          .toList();
      type = json['type'];

    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }

  @override
  String toString() => 'Product { id: $id name: $name }';

  /// Get product ID from mix String productID-ProductVariantID
  static String cleanProductID(productString) {
    if (productString.contains("-")) {
      return productString.split("-")[0].toString();
    } else if (productString.contains("+")) {
      return productString.split("+")[0].toString();
    } else {
      return productString.toString();
    }
  }

  double get productOptionsPrice {
    double _price = 0.0;
    if (selectedOptions?.isEmpty ?? true) {
      return _price;
    }

    for (var option in selectedOptions) {
      _price += (double.tryParse(option?.price ?? '0.0') ?? 0.0);
    }
    return _price;
  }

}
