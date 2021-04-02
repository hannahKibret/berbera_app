import 'dart:io';

import 'package:berbera_app/config/Config.dart';
import 'package:berbera_app/config/general.dart';
import 'package:berbera_app/models/category.dart';
import 'package:berbera_app/models/product.dart';
import 'package:berbera_app/services/api_service.dart';
import 'package:berbera_app/widgets/expansion_info.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:flutter_absolute_path/flutter_absolute_path.dart';


// ignore: must_be_immutable
class InventoryAdd extends StatefulWidget {
Product product = Product();
String title;

  InventoryAdd({product, title});
  @override
  _InventoryAddState createState() => _InventoryAddState(product,title);
}

class _InventoryAddState extends State<InventoryAdd> {
  bool isChecked = false;
  Product product;
  APIService apiService;
  String title;
  _InventoryAddState(this.product, this.title);
List<Widget> variationList =[];
  bool _formChanged = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  FlutterUploader uploader = FlutterUploader();
  List<FileItem> items = [];
  bool checked = false;
  List<String> catIds = [];
  List<bool> checkeds = [];
  TextEditingController _controller_name = TextEditingController();
  TextEditingController _controller_description_ = TextEditingController();
  TextEditingController _controller_regualrprice = TextEditingController();
  TextEditingController _controller_salesprice = TextEditingController();
  TextEditingController _controller_stock = TextEditingController();
  TextEditingController _controller_shortdescription = TextEditingController();
  List<Map<String, String>> imagess =[];
  List<String> imagesss =[];
  bool _stockisenabled = false;
  String _selected_type;
  List<Map<String, bool>> catMap = [];

  List<DropdownMenuItem> category_items =[];
  List<bool> isCheckeds = [];
      Future<List<bool>> addCategory()async{
        List<bool> isCheckeds = [];
           List<Category> caty = await apiService.getcategories();
           caty.forEach((category){
              isCheckeds.add(false);
           });
           return isCheckeds;
        }

       

  void initState() {

    focusNode = FocusNode();
    product = Product();
    apiService = APIService();
// category_items =_radio_categry();
// checkeds = addCategory() as List<bool>;
Config.catMaps.clear();
Config.ids.clear();
 getCategory();
 catMap = Config.catMaps;

//  for(var catM in Config.catMaps){
//    catMap.add(catM);
//  }
  print(catMap);
    super.initState();
  }
  List<Asset> images = <Asset>[];
    String _error = 'No Error Detected!';
  
  Future<void> loadAssets()async{
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected!';
    try{
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: 'chat'),
        materialOptions: MaterialOptions(
          actionBarColor: '#fff000',
          actionBarTitle: 'Berbera Market',
          allViewTitle: 'All Photos',
          useDetailsView: false,
          selectCircleStrokeColor: '#000000',

          )
        );
    }on Exception catch(e){
      error = e.toString();
    }

   // if(!mounted){
      setState(() {
              images = resultList;
              _error = error;
              for(File file in f){
              imagess.add({'src':Config.imageURL+basename(file.path)});
              imagesss.add(Config.imageURL+basename(file.path));
              }
              product.images = imagesss;
              print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${product.imagess}");
              
            });
   // }
  }

  Widget buildCarousel(){
   
    return  f.isNotEmpty  ?Container(
            height: 200,
            child: Align(
              alignment: Alignment.topCenter,
              child:
               Carousel(
              boxFit: BoxFit.fill,
              images : f.map((file)=>Image.file(file, width: 300,height:300,)).toList(),
                // images:images.map((image)
                // => AssetThumb(
                //   asset: image,
                //   width: 300,
                //   height: 300
                // ),
                // ).toList(),
                // autoplay: true,
                // autoplayDuration: Duration(seconds: 6),
                dotSize: 0.0,
                indicatorBgPadding: 0.0,
                //animationCurve: Curves.fastOutSlowIn,
                //animationDuration: Duration(milliseconds: 1000),
              ),
               
              
            ),
          ):SizedBox();
  }




  @override
  Widget build(BuildContext context) {
    //addCategory();
    
    return Scaffold(
        appBar: AppBar(
          title: Text("title" , style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
child: Form(
  key: _formKey,
  
  child:Column(
  children: [
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "General".toUpperCase(),
      children: [
DropdownButtonFormField(items: product_types,
  onChanged:(value){ setState((){
_selected_type = value;
print('fjfjjflkjfkfjl$value');
product.type = value;

  });},
hint:Text( "Product Type"),
  value: _selected_type,
),
      SizedBox(height: 10,),
      TextFormField(
        decoration: InputDecoration(hintText: "Product Name",labelText: "Title"),
       // controller: _controller_name,
       onSaved: (val)=> product.name = val,
        keyboardType: TextInputType.text,
      ),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(hintText: "Short Description",labelText: "Description"),
          keyboardType: TextInputType.multiline,
           onSaved: (val)=> product.description= val,
          maxLines: null,
        ),
        SizedBox(height: 10,),

        TextFormField(
          decoration: InputDecoration(hintText: "Price",labelText: "Regular Price"),
          // controller: _controller_name,
           onSaved: (val)=> product.regularPrice = val,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 5,),
        TextFormField(
          decoration: InputDecoration(hintText: "Sales",labelText: "Sales Price"),
          // controller: _controller_name,
          keyboardType: TextInputType.text,
          // onSaved: (val)=> widget.product.salePrice = val,
        ),
//         SizedBox(height: 10,),
//         DropdownButton(hint:Text("Category") ,
          
//           items: category_items, 
//           onChanged: (value){ setState((){
//   _selected_type = value;
// });},),
// 
   ExpansionTile(
          title: Row(
            children: <Widget>[
             // Icon(Icons.color_lens, color: Colors.orangeAccent,),
              SizedBox(width: 10),
              Text('Category', style: TextStyle(fontSize: 20,),),
            ],
          ),
          children: getCategoryWidget(),
        ),
        SizedBox(height: 10,),

      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Image and Gallery".toUpperCase(),

      children: [
        Center(child: Text('Error: $_error')),
        ElevatedButton(
          child:Text('Pick Images'),
          onPressed: ()async{
            FilePickerResult result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.custom,
              allowedExtensions: ['jpg', 'png', 'jpeg'],

            );
            if(result != null){
              setState((){f = result.paths.map((path)=> File(path)).toList();});
              
               print('iiiiiiiiiiiiiiiiiiiiiiiii$f');
                for(File file in f){
                  print('file${file.path}');
              imagess.add({'src':Config.imageURL+basename(file.path)});
              imagesss.add(Config.imageURL+basename(file.path));
                
              }
              setState(() {
                  product.images = imagesss;
                              
                            });
            
              print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${product.images}");
            }
            

              //loadAssets();
              //
          }
        ),
        buildCarousel(),
      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Inventory".toUpperCase(),
      children: [
Row(children: [
  Text("Enable stock managing"),
  Checkbox(value: _stockisenabled, onChanged: (bool value){
    setState(() {
      _stockisenabled = value;
      
      product.manageStock = value;
      print('mmmmmm${product.manageStock}');
    });
  })
],),
        TextFormField(
          keyboardType: TextInputType.number,
           onSaved: (val){ product.stockQuantity= int.parse(val);print(product.stockQuantity);},
          decoration: InputDecoration(
        //  hintText: "Quantity",
          labelText: "Quantity"
        ),),
        SizedBox(height: 10,),
        DropdownButtonFormField(
          items: product_status,
          onChanged:(value){ setState((){
            _selected_type = value;
            
            product.stockStatus  = _selected_type;
          });},
          hint:Text( "Product Type"),
          value: _selected_type,
        )

      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Attributes".toUpperCase(),
      children: [
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.color_lens, color: Colors.orangeAccent,),
              SizedBox(width: 10),
              Text('Color', style: TextStyle(fontSize: 20,),),
            ],
          ),
          children: getAttributeWidget("1"),
        ),
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.format_size, color: Colors.orangeAccent,),
              SizedBox(width: 10),
              Text('Size', style: TextStyle(fontSize: 20,),),
            ],
          ),
          children: getAttributeWidget("2"),
        )
      ],
    ),
    SizedBox(height: 10,),
    ExpansionInfo(
      expand: true,
      title: "Variation".toUpperCase(),
      children:  [
        Column(children: variationList,),
        RaisedButton(onPressed: (){
          setState(() {
            
            // variationList.add(getVariationWidget(color, size));
          });
        },
        child: Text("Add Variation"),)
      ]
    ),
    RaisedButton(
      child:Text('add'),
      onPressed:(){
        final form = _formKey.currentState;
        if (form.validate()) {
         
          form.save();
          
         uploadImage();
        
          product.stockStatus = "instock";
          product.attributes=[];
        catIds.clear();
         for(int i=0;i<Config.catMaps.length;i++){
           if(Config.catMaps[i].entries.first.value){
             catIds.add(Config.ids[i]);
           }
         }
         
          product.categoryIdss.clear();
          for(String id in catIds){
            product.categoryIdss.add({'id': id});
          }
          print('idss${product.categoryIdss}');
         product.categoryIds = ['9'];
           print('ppppppppppppppppppppppppppppppppp${product.isEmptyProduct()}');
        
          apiService.update_create_Prodcut(product);
          
        }
      }
    )

  ],
),
        ),
        ));

 
}


List<Widget> getCategoryWidget(){
  APIService apiService;
  apiService = new APIService();
  List<Widget> _widgets = [];
  try{
   // apiService.getcategories().then((value) {
     
      for(int i=0; i< Config.catMaps.length; i++){
        
        _widgets.add( Row(
          children: [
            Checkbox(value: Config.catMaps[i].entries.first.value, onChanged: (bool isChecked){
              
             setState(() {
                            Config.catMaps[i][Config.catMaps[i].entries.first.key]= isChecked;
                            
                          });
                          print(isCheckeds);
              
            },),
            Text(Config.catMaps[i].entries.first.key),
          ],
        ));
      }
    
    return _widgets;
  }catch(e){
printLog(e.toString());
  }

}

List<File> f = [];
 Future uploadImage() async {
   // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (f.isNotEmpty) {
      for(File file in f){
       var pathName = '';
       items.add(
         FileItem(
           filename: '',
           savedDir: file.path,
           fieldname: 'file',
         
         ));
      }
      // final String filename = basename(image.path);
      // final String savedDir = dirname(image.path);
      final tag = "berbera image upload";
      var url = Config.imageURL;
      // var fileItem = FileItem(
      //   filename: filename,
      //   savedDir: savedDir,
      //   fieldname: "file",
      // );

      var taskId = await uploader.enqueue(
              url: url,
              data: {},
              files: items,
              method: UploadMethod.POST,
              tag: tag,
              showNotification: true,
            );

      // setState(() {
      //   _tasks.putIfAbsent(
      //       tag,
      //       () => UploadItem(
      //             id: taskId,
      //             tag: tag,
      //             type: MediaType.Video,
      //             status: UploadTaskStatus.enqueued,
      //           ));
      // });
    }
  }



 void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }


List<DropdownMenuItem> _radio_categry(){
  apiService = new APIService();
  List<DropdownMenuItem> _category_items =[];
try{
  printLog("try phase");
  apiService.getcategories().then((value){
   // List<Category> _categories = value;
    List<bool> isCheckedss = [];
      for(int i=0; i< value.length; i++){
         isCheckedss.add(false);
      }
    for(int i=0; i< value.length; i++){
      
     
      _category_items.add(DropdownMenuItem (child : Row(children: [
        Checkbox(value: isCheckeds[i],
            onChanged: (bool value){
                setState(() {
                    isCheckeds[i] = value;              
                                });
            }),
        Text(value[i].name)])));
    }
  });
  return _category_items;
}catch(e){
  printLog(e.toString());
}

return _category_items;
}


}
