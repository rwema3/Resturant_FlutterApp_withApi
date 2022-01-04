import 'package:flutter/material.dart';
import '../repository/beer_repository.dart';
import '../models/beer.dart';
import '../widget/beer_title.dart';

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Beer> _beers = <Beer>[];

  @override
  void initState(){
    super.initState();
    listenForBeers();
  }

  @override 
  Widget build(BuildContext context) => Scaffold(

      body: ListView.builder(
        itemCount: _beers.length,
        itemBuilder: (context, index) => BeerTile(_beers[index]),
      ),

    );
    void listenForBeers() async{
     final Stream<Beer> stream = await getBeers();
      stream.listen((Beer beer) =>
      setState(() => _beers.add(beer))
    );
  }

}



