import 'package:active_ecommerce_flutter/data_model/products_list_model.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/repositories/upload_product.dart';
import 'package:active_ecommerce_flutter/screens/update_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class ProductList extends StatefulWidget {

  
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> productList;
  bool loadingData = true;

  @override
  void initState() {
    super.initState();
    _getProductList();  
  }

  _getProductList()async{
    final getProductList  = await UploadProduct().getProductList(userId: user_id.$);
    productList = getProductList.products;
    setState(() {
      loadingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: loadingData == false 
        ? _body()
        : Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator()
          )
        )  ,
    );
  }

  _body(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {  
          final data = productList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/placeholder.png'),
                      height: 80,
                      width:80 ,
                      fit: BoxFit.contain
                    )
                  ),
                  Spacer(),
                  Text(
                    data.name,
                    style: TextStyle(fontSize:14, color:Colors.black, fontWeight:FontWeight.bold), 
                    overflow:TextOverflow.ellipsis, 
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: ()async{
                      final  type = 'product_update';
                      http.Response route;
                      route = await UploadProduct().getRoute(type: type, productId: data.id);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UpdateProduct(
                            route: route,
                          )
                        )
                      );
                    }, 
                    child: Text('Update', style: TextStyle(color: Colors.black),)
                  )
                ],
              ),
            ),
          );        
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        child:  Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: Text(
        "Product List",
        style: TextStyle(fontSize: 16, color: MyTheme.accent_color),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }
}