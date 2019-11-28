import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_new/drink_detail.dart';
import 'package:flutter_new/main.dart';
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
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        myColor,
        Colors.orange,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child: Text("Cocktail App")),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: res!=null ? ListView.builder(
            itemCount: drinks.length,
            itemBuilder: (context,index){
              var drink = drinks[index];
              return ListTile(
                leading: Hero(
                  tag: drink["idDrink"],
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      drink["strDrinkThumb"] ??
                        "https://cdn11.bigcommerce.com/s-gk06t3dnh9/stencil/e6196740-c8f0-0137-e35e-0242ac110024/icons/icon-no-image.svg",
                    ),
                  )
                ),
                title: Text(
                    "${drink["strDrink"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    "${drink["idDrink"]}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>DrinkDetail(drink: drink),
                        fullscreenDialog: true,
                        ),
                      );
                  },
              );
            },
          )
          :CircularProgressIndicator(backgroundColor: Colors.white,)

        ),
      ),
    );
  }
}
