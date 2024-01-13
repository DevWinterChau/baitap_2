import 'package:dart/Pages/FecthDataUsingHTTP.dart';
import 'package:dart/Pages/UIMessage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/Cart.dart';
import 'Pages/CartPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        // Thêm các Provider khác nếu có
      ],
      child: MaterialApp(
        home: MyApp(),
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
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: Text("Provider Demo"),
            )
          ],
        ),
        )
      ),
    );
  }
}
