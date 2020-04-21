import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:naming_app/src/kor_random_list.dart';
import 'package:naming_app/src/random_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              child: Text('English Naming'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RandomList()));
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(24),),
          Center(
            child: RaisedButton(
              child: Text('Korean Naming'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => KorRandomList()));
              },
            ),
          )
        ],
      ),
    );
  }
}
