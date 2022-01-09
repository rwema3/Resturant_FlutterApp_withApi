import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(
    const MaterialApp(
    ),
  );
}//flutter
class Me extends StatefulWidget {
  @override
  State<Me> createState() => _MeState();
}
class _MeState extends State<Me> {
//if the login form is submitted
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://rwemaapi.000webhostapp.com/',
      ),
//flutter
    );
  }
}