import 'package:active_ecommerce_flutter/custom/custom_webview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateProduct extends StatelessWidget {

  final http.Response route;


  const UpdateProduct({Key key, this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustoWebView(
      response: route,
      title: 'Update product'
    );
  }
}