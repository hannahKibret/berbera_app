import 'package:berbera_app/pages/inventory_view.dart';
import 'package:flutter/material.dart';

class CategoryDropDownField extends StatelessWidget {
  String selectedCategory;
  Function onChanged;

  CategoryDropDownField({this.selectedCategory, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      isDense: true,
      //itemHeight: 60,
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(8.0)),
        labelText: "Category",
      ),
      value: selectedCategory,
      onChanged: (String newSelection) => onChanged(newSelection),
      items: Categories.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 12.0)),
        );
      }).toList(),
    );
  }
}
