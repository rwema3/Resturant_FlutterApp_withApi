import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(
    const MaterialApp(
    ),
  );
}

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {
    final number = '+0780845415';
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/rw.jpg",width: 70,
                  height: 80,),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bagirishya Rwema",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Back-end Devoloper",
                      style: TextStyle(color: Color(0xff07172f), fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff07172f),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "219000504",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),



        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/gg.jpg",width: 80,
                  height: 80,),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Robert Peace",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Front-End Devoloper",
                      style: TextStyle(color: Color(0xff07172f), fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff07172f),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "219000631",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
          child: Container(
            child: Text(
              "Rwema & Robert are IT Specialists and Programmers | Front-end & Back-end Developers |. They develop Interactive Websites and Apps for iOS and Android.",
              style: TextStyle(color: Color(0xff07172f), fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: <Widget>[
              Text(
                "Contact Us:",
                style: TextStyle(
                    color: Color(0xff07172f), fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),
        RaisedButton(
          onPressed: () {
            customLaunch('https://rwemabagirishya.herokuapp.com/');
          },
          child: Text('https://rwemabagirishya.herokuapp.com/'),
        ),
        RaisedButton(
          onPressed: () {
            customLaunch(
                'mailto:your@email.com?subject=test%20subject&body=test%20body');
          },
          child: Text('rwemadominik3@gmail.com'),
        ),
        RaisedButton(
          onPressed: () {
            customLaunch('tel:+250 780 845 415');
          },
          child: Text('0780845415'),
        ),
        RaisedButton(
          onPressed: () {
            customLaunch('sms:0780845415');
          },
          child: Text('SMS to 0780845415'),
        ),
      ],
    );
  }
}


