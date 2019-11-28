import 'package:flutter/material.dart';
import 'package:flutter_new/homepage.dart';
// import 'package:flutter/src/material/colors.dart' show Colors;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cyan = Colors.cyan;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter App",
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.cyan,
            buttonTheme: ButtonThemeData(
              buttonColor: cyan
            )
          ,
      ),
      home: Homepage(),
    );
  }
}