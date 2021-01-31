class ProductAddons {
  String name;
  String description;
  String type;
  int position;
  List<AddonsOption> options;
  bool required;
  Map<String, AddonsOption> defaultOptions = {};

  ProductAddons({
    this.name,
    this.description,
    this.type,
    this.position,
    this.options,
    this.required,
  });

  bool get isRadioButtonType => type == 'multiple_choice';

  bool get isCheckboxType => type == 'checkbox';

  bool get isTextAreaType => type == 'custom_textarea';

  ProductAddons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    type = json['type'];
    position = json['position'];
    required = json['required'] == 1;
    if (json['options'] != null) {
      final List<dynamic> values = json['options'] ?? [];
      options = List<AddonsOption>.generate(
        values.length,
            (index) {
          final AddonsOption option = AddonsOption.fromJson(values[index]);
          option.parent = name;
          if (option.isDefault) {
            defaultOptions[option.label] = option;
          }
          return option;
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['position'] = position;
    data['required'] = required ? 1 : 0;
    if (options != null) {
      data['options'] = options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddonsOption {
  String parent;
  String label;
  String price;
  bool isDefault;

  AddonsOption({this.parent, this.label, this.price, this.isDefault});

  AddonsOption.fromJson(Map<String, dynamic> json) {
    parent = json['parent'];
    label = json['label'];
    price = json['price'];
    isDefault = json['default'] == '1';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent'] = parent;
    data['label'] = label;
    data['price'] = price;
    data['default'] = isDefault ? '1' : '0';
    return data;
  }
}
