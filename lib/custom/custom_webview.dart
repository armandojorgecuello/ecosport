
import 'dart:convert';
import 'dart:io';

import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:webview_flutter/webview_flutter.dart';

class CustoWebView extends StatefulWidget {
  final http.Response response;
  final String title;
  const CustoWebView({  this.response, this.title, Key key, }) : super(key: key);

  @override
  _CustoWebViewState createState() => _CustoWebViewState();
}

class _CustoWebViewState extends State<CustoWebView> {
    WebViewController _webViewController;

  
  bool _webViewisLoading = true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: _body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
          onPressed: () => Navigator.of(context).pop(), 
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 16, color: MyTheme.accent_color),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  _body(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: ( webViewController) {
              var route = jsonDecode(widget.response.body);
              _webViewController =  webViewController;
              _webViewController.loadUrl(route['verification_code']);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
          ),
        ],
      )
    );
  }

  

}