import 'package:flutter/material.dart';
import 'package:berbera_app/models/item.dart';

import 'inventory_add.dart';

class  InventoryView extends StatefulWidget {
  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {

  Item item1
  = Item();
  Item item2
  = Item();
  List<Item> items = loadItem();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Item',style:TextStyle(color:Colors.white)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){
            showSearch(context: context, delegate: ItemSearch());
          },),
          SizedBox(width: 20.0,),
        ],
      ),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:10.0 ),
        child:ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              // downloadImagee(snap.data.documents[index]['image']);
              return  Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal:15.0 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(items[index].itemName,style:TextStyle(fontSize: 20.0)),
                          SizedBox(height: 12.0),
                          Text(items[index].qty.toString(),style:TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(items[index].date,style:TextStyle(fontSize: 20.0)),
                          SizedBox(height: 12.0),
                          Text(items[index].price.toString(),style:TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.chevron_right,color:Colors.black),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> InventoryAdd(itemName: items[index].itemName, brandName: items[index].brandName, category: items[index].category, price: items[index].price, qty: items[index].qty, itemDetail: items[index].detail,image:null),
                                settings: RouteSettings(
                                    arguments: ''
                                ),
                              ),
                            );

                          }
                      ),
                    ],
                  ),
                ),
              );}

        ),
      ),
    );
  }

}

class ItemSearch extends SearchDelegate<Item>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
     query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon:Icon(Icons.arrow_back),onPressed: (){
      close(context,null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty? loadItem()
        : loadItem().where((p) => p.itemName.toUpperCase().startsWith(query.toUpperCase())).toList();
    return myList.isEmpty? Center(child: Text('No Result Found',style: TextStyle(fontSize: 20.0)))
        : Container(
        padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:10.0 ),
        child: ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index){
        final Item item = myList[index];
        return
                Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal:15.0 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(item.itemName,style:TextStyle(fontSize: 20.0)),
                          SizedBox(height: 12.0),
                          Text(item.qty.toString(),style:TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(item.date,style:TextStyle(fontSize: 20.0)),
                          SizedBox(height: 12.0),
                          Text(item.price.toString(),style:TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.chevron_right,color:Colors.black),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> InventoryAdd(itemName: item.itemName, brandName: item.brandName, category: item.category, price: item.price, qty: item.qty, itemDetail: item.detail,image:null),
                                settings: RouteSettings(
                                    arguments: ''
                                ),
                              ),
                            );

                          }
                      ),
                    ],
                  ),
                ),
              );

    }
    )
    );
  }

}
