import 'package:flutter/material.dart';

import 'firstapp.dart';
import 'strings.dart';


void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      home: FirstApp(),
    );
  }
}
