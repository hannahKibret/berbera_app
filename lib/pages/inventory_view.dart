import 'package:berbera_app/models/product.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:flutter/material.dart';


import 'inventory_add.dart';

List<Product> loadProducts()
{
  APIService apiService = new APIService();
  List<Product> products=[];
  apiService.getProducts().then((value) {
    products = value;
    print('========items=======${products.length}');
  });
  return products;
}

List<String> Categories = ["Male", "Female", "Kids", "All"];

class InventoryView extends StatefulWidget {

  Product product;

  InventoryView({this.product});

  @override
  _InventoryViewState createState() => _InventoryViewState(product);
}

class _InventoryViewState extends State<InventoryView> {
  Product product;

  _InventoryViewState(this.product);

  List<Product> items ;

  @override
  void initState() {
    items =loadProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: ItemSearch());
            },
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body:  Container(
        child:  GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 /2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
            itemCount: items.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                elevation: 0.8,
                child: Column(
                  children: [
                    Image.network(items[index].imageFeature),
                    Text(items[index].name),
                    Text(items[index].averageRating.toString()),
                    Text(items[index].categories.toString()),
                    Text(items[index].stockQuantity.toString()),
                  ],
                ),
              );
            }),
      )
    );
  }
}

class ItemSearch extends SearchDelegate<Product> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? loadProducts()
        : loadProducts()
            .where(
                (p) => p.name.toUpperCase().startsWith(query.toUpperCase()))
            .toList();
    return myList.isEmpty
        ? Center(
            child: Text('No Product Found', style: TextStyle(fontSize: 20.0)))
        : Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  final Product item = myList[index];
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: TextStyle(fontSize: 20.0)),
                              SizedBox(height: 12.0),
                              // Text(item.qty.toString(),
                              //     style: TextStyle(fontSize: 20.0)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.stockQuantity.toString(), style: TextStyle(fontSize: 20.0)),
                              SizedBox(height: 12.0),
                              Text(item.price.toString(),
                                  style: TextStyle(fontSize: 20.0)),
                            ],
                          ),
                          IconButton(
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InventoryAdd(),
                                    settings: RouteSettings(arguments: ''),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
