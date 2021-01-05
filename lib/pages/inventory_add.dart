import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:berbera_app/models/item.dart';
import 'package:berbera_app/widgets/category_dropdown_field.dart';

// ignore: must_be_immutable
class InventoryAdd extends StatefulWidget {
  String itemName, brandName, category, itemDetail;
  int price, qty;
  File image;

  InventoryAdd(
      {@required this.itemName,
      @required this.brandName,
      @required this.category,
      @required this.price,
      @required this.qty,
      @required this.itemDetail,
      @required this.image});
  @override
  _InventoryAddState createState() => _InventoryAddState();
}

class _InventoryAddState extends State<InventoryAdd> {
  bool _formChanged = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  File _image;
  // String _downloadURL;
  String _category;

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();

  void initState() {
    super.initState();
    focusNode = FocusNode();
    _controller.text = widget.itemName;
    _controller2.text = widget.brandName;
    _category = (widget.category == '') ? Categories[0] : widget.category;
    _controller3.text = (widget.price == 0) ? '' : widget.price.toString();
    _controller4.text = (widget.qty == 0) ? '' : widget.qty.toString();
    _controller5.text = widget.itemDetail;
    _image = widget.image;

    //_store.storeLocation = StoreLocations[0];
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => _image = image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Form(
              key: _formKey,
              onChanged: _onFormChange,
              child: ListView(children: [
                SizedBox(height: 35.0),
                Container(
                  height: 30.0,
                  child: TextFormField(
                    autofocus: true,
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    // onSaved: (String val) => this._profile.contact = val,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      // helperText: "Optional",
                      labelText: "Item Name",
                    ),
                    validator: (String val) {
                      if (val == '') {
                        return "Field cannot be left blank";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  height: 30.0,
                  child: TextFormField(
                    autofocus: true,
                    controller: _controller2,
                    keyboardType: TextInputType.text,
                    // onSaved: (String val) => this._profile.contact = val,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      // helperText: "Optional",
                      labelText: "Brand Name",
                    ),
                    validator: (String val) {
                      if (val == '') {
                        return "Field cannot be left blank";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  height: 30.0,
                  child: CategoryDropDownField(
                    selectedCategory: this._category,
                    onChanged: (newCategory) {
                      setState(() {
                        //this._store.category = newCategory;
                        this._category = newCategory;
                      });
                    },
                  ),
                ),
                SizedBox(height: 35.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                        width: 150.0,
                        child: TextFormField(
                          autofocus: true,
                          controller: _controller3,
                          keyboardType: TextInputType.text,
                          // onSaved: (String val) => this._profile.contact = val,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            // helperText: "Optional",
                            labelText: "Price",
                          ),
                          validator: (String val) {
                            if (val == '') {
                              return "Field cannot be left blank";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 150.0,
                        child: TextFormField(
                          autofocus: true,
                          controller: _controller4,
                          keyboardType: TextInputType.text,
                          // onSaved: (String val) => this._profile.contact = val,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            // helperText: "Optional",
                            labelText: "Qty.",
                          ),
                          validator: (String val) {
                            if (val == '') {
                              return "Field cannot be left blank";
                            }
                            return null;
                          },
                        ),
                      ),
                    ]),
                SizedBox(height: 35.0),
                Container(
                  //height:200.0,

                  child: TextFormField(
                    autofocus: true,
                    controller: _controller5,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // onSaved: (String val) => this._profile.contact = val,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      // helperText: "Optional",
                      labelText: "Item Detail",
                    ),
                    validator: (String val) {
                      if (val == '') {
                        return "Field cannot be left blank";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 35.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200.0,
                        height: 143.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: (_image != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(_image, fit: BoxFit.fill))
                            : SizedBox(),
                      ),
                      RaisedButton(
                          color: Colors.white,
                          textColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('Add image'),
                          onPressed: () {
                            getImage();
                          }),
                    ]),
                SizedBox(height: 35.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green.shade300),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('Save'),
                          onPressed: () {}),
                      RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red.shade300),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('Delete'),
                          onPressed: () {})
                    ]),
                SizedBox(height: 35.0),
              ]),
            )));
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }
}
