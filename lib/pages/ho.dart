import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(
    const MaterialApp(
    ),
  );
}
class Ho extends StatefulWidget {

  @override
  State<Ho> createState() => _HoState();

}

class _HoState extends State<Ho> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WebViewPlus(
        initialUrl: 'https://rwemaapi.000webhostapp.com',
        javascriptMode: JavascriptMode.unrestricted,

      ),

    );
  }
}