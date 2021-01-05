class Order {
  String id;
  String status;
  String currency;
  String version;
  String prices_include_tax;
  String date_created;
  String date_modified;
  String discount_total;
  String discount_tax;
  String shipping_total;
  String shipping_tax;
  String total;
  String total_tax;
  String customer_id;
  String order_key;
  OrderMetaData meta_data;
  OrderItem line_items;

  Order({
    this.id,
    this.status,
    this.currency,
    this.version,
    this.prices_include_tax,
    this.date_created,
    this.date_modified,
    this.discount_total,
    this.discount_tax,
    this.shipping_total,
    this.shipping_tax,
    this.total,
    this.total_tax,
    this.customer_id,
    this.order_key,
    this.meta_data,
    this.line_items,
  });

  Order.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    currency = json['currency'];
    version = json['version'];
    prices_include_tax = json['prices_include_tax'];
    date_created = json['date_created'];
    date_modified = json['date_modified'];
    discount_total = json['discount_total'];
    discount_tax = json['discount_tax'];
    shipping_total = json['shipping_total'];
    shipping_tax = json['shipping_tax'];
    total = json['total'];
    total_tax = json['total_tax'];
    customer_id = json['customer_id'];
    order_key = json['order_key'];
    meta_data = OrderMetaData.fromJSON(json['meta_data']);
    line_items = OrderItem.fromJSON(json['line_items']);
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['status'] = this.status;
    json['currency'] = this.currency;
    json['version'] = this.version;
    json['prices_include_tax'] = this.prices_include_tax;
    json['date_created'] = this.date_created;
    json['date_modified'] = this.date_modified;
    json['discount_total'] = this.discount_total;
    json['discount_tax'] = this.discount_tax;
    json['shipping_total'] = this.shipping_total;
    json['shipping_tax'] = this.shipping_tax;
    json['total'] = this.total;
    json['total_tax'] = this.total_tax;
    json['customer_id'] = this.customer_id;
    json['order_key'] = this.order_key;
    json['meta_data'] = this.meta_data.toJSON;
    json['line_items'] = this.line_items.toJSON;

    return json;
  }
}

class OrderMetaData {
  /*

  {
                "id": 6958,
                "key": "is_vat_exempt",
                "value": "no"
            },
            {
                "id": 6959,
                "key": "_wcfmmp_user_location",
                "value": "Kotebe, Yeka, Addis Ababa, 4343, Ethiopia"
            },
            {
                "id": 6960,
                "key": "_wcfmmp_user_location_lat",
                "value": "9.0371282"
            },
            {
                "id": 6961,
                "key": "_wcfmmp_user_location_lng",
                "value": "38.8398518"
            },
            {
                "id": 6962,
                "key": "_wcfmmp_order_processed",
                "value": "yes"
            },
            {
                "id": 6967,
                "key": "_wcfm_new_order_notified",
                "value": "yes"
            },
            {
                "id": 6968,
                "key": "_wcfm_membership_order_processed",
                "value": "yes"
            },
            {
                "id": 6969,
                "key": "_wcfmmp_order_email_triggered",
                "value": "yes"
            }

   */
  OrderMetaData.fromJSON(Map<String, dynamic> json) {}

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    return json;
  }
}

class OrderItem {
  String id;
  String name;
  String product_id;
  String variation_id;
  String quantity;
  String tax_class;
  String subtotal;
  String subtotal_tax;
  String total;
  String total_tax;
  String taxes;

  OrderItem(
      {this.id,
      this.name,
      this.product_id,
      this.variation_id,
      this.quantity,
      this.tax_class,
      this.subtotal,
      this.subtotal_tax,
      this.total,
      this.total_tax,
      this.taxes});

  OrderItem.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    product_id = json['product_id'];
    variation_id = json['variant_id'];
    quantity = json['quantity'];
    tax_class = json['tax_class'];
    subtotal = json['subtotal'];
    subtotal_tax = json['subtotal_tax'];
    total = json['total'];
    total_tax = json['total_tax'];
    taxes = json['taxes'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['name'] = this.name;
    json['product_id'] = this.product_id;
    json['variant_id'] = this.variation_id;
    json['tax_class'] = this.tax_class;
    json['subtotal'] = this.subtotal;
    json['subtotal_tax'] = this.subtotal_tax;
    json['total'] = this.total;
    json['total_tax'] = this.total_tax;
    json['taxes'] = this.taxes;

    return json;
  }
}
