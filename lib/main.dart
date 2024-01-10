import 'dart:convert';

import 'package:dart/Models/UserModel.dart';
import 'package:dart/Models/UserModelList.dart';
import 'package:dart/Pages/UIMessage.dart';
import 'package:dart/widget/AvatarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Pages/FecthDataUsingHTTP.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold
                    )// Set the background color
                  ),
                  onPressed: () {
                    // Navigate to UI Message screen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("UI Message - Load Json from Assets"),

                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple[100],
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold
                      )// Set the background color
                  ),
                  onPressed: () {
                    // Navigate to API screen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FethDataUsingHttp()));
                  },
                  child: Text("Fetch API"),
                ),
              ],
            )
      ),
    );
  }
}
