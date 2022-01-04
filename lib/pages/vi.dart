import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
void main() {
  runApp(
    const MaterialApp(
    ),
  );
}
class Vi extends StatefulWidget {
  @override
  State<Vi> createState() => _ViState();
}
class _ViState extends State<Vi> {

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