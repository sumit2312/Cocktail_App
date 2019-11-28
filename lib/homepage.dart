import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var api="https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res,drinks;
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData()async{
    res = await  http.get(api);
    print(res.body);
    drinks = jsonDecode(res.body)["drinks"];
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: Text("New App"),
        elevation: 0.5,
        backgroundColor: Colors.pink[300],
      ),
      body: Center(
        child: res!=null ? ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${drinks[index]["strDrink"]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
            ); 
          },
        ):CircularProgressIndicator(backgroundColor: Colors.white,)

      ),
    );
  }
}
