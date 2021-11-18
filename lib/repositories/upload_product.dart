import 'dart:convert';

import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/products_list_model.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;


class UploadProduct {
  
  Future<http.Response> getRoute({String type, int productId  })async{
    
    Uri _uri = Uri.parse('${AppConfig.BASE_URL}/auth/profile_web');
    final _header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${access_token.$}",
      'Accept': 'application/json',
    };
    var _body =jsonEncode ({
      "type" : type,
      "product_id" : productId,
    });
    
    return await http.post(_uri, headers: _header, body:_body);
    //final decodeData = json.decode(response.body
  }


  Future<ProductListModel> getProductList({ int userId  })async{
    
    Uri _uri = Uri.parse('${AppConfig.BASE_URL}/products/get_products_list');
    final _header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${access_token.$}",
      'Accept': 'application/json',
    };
    var _body =jsonEncode ({
      "user_id" : userId,
    });
    
    final  response = await http.post(_uri, headers: _header, body:_body);
    final data = json.decode(response.body);
    var _data  = ProductListModel.fromJson(data);
    return _data;
  }



}