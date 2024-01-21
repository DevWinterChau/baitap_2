import 'package:dart/Modules/food/pages/FoodListPage.dart';
import 'package:dart/Pages/FecthDataUsingHTTP.dart';
import 'package:dart/Pages/SaveImagePage.dart';
import 'package:dart/Pages/UIMessage.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'Models/Cart.dart';
import 'Pages/CartPage.dart';
import 'Pages/DemoStreamBuilder.dart';
import 'Pages/Dempage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        // Add other providers if needed
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          home: MyApp(),
        ),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: Text("Trang chủ"),
        ),

        body: Center(
          child:
          Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text("UI Message"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FethDataUsingHttp()),
                );
              },
              child: Text("Fetch API"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaveImagePage()),
                );
              },
              child: Text("Save Image From Internet"),
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: Text("Provider Demo"),
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DemoStreamBuilderPage()),
                );
              },
              child: Text("StreamBuilder Demo"),
            ),

            SizedBox(height: 10,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  FoodListPage()),
                );
              },
              child: Text("BloC Parten"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DemoFuttureBuilderPage()),
                );
              },
              child: Text("DemoFuttureBuilderPag"),
            ),
          ],
        ),
        )
      ),
    );
  }
}
