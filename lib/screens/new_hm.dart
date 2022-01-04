import 'package:flutter/material.dart';
import 'package:rwemaapi/pages/ho.dart';
import 'package:rwemaapi/pages/po.dart';
import 'package:rwemaapi/pages/vi.dart';

import 'home.dart';


void main() {
  runApp(
    const MaterialApp(
    ),
  );
}
class WebViewApp extends StatefulWidget {
  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Ho(),
    Home(),
    Vi(),
    PageBody(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ const Color(0xff07172f),
                const Color(0xff338bbb)],
            ),
          ),
        ),
        leading: Icon(Icons.restaurant),
        title: Text('Rwema & Robert Resto'),
        actions: [
          Icon(Icons.emoji_food_beverage_outlined),

        ],


      ),
      body: pageList[pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value){
          setState(() {
            pageIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff07172f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_drinks_sharp),
            label: 'Drinks',
            backgroundColor: Color(0xff07172f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Restos',
            backgroundColor: Color(0xff07172f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_outlined),
            label: 'About',
            backgroundColor: Color(0xff07172f),
          ),

        ],
      ),
    );
  }
}