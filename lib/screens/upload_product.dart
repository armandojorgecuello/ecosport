import 'package:active_ecommerce_flutter/custom/custom_webview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadProductPage extends StatelessWidget {
  final http.Response response;
  final String title;

  const UploadProductPage({Key key, this.response, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustoWebView(
      response: response,
      title: title,
    );
  }
}