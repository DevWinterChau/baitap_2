
import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:overlay_support/overlay_support.dart';

class DemoStreamBuilderPage extends StatefulWidget {
  @override
  _DemoStreamBuilderPageState createState() => _DemoStreamBuilderPageState();
}

class _DemoStreamBuilderPageState extends State<DemoStreamBuilderPage> {
  int dem = 0;
  final streamcontroller = StreamController<int>();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
    streamcontroller.close();
  }

  @override
  Widget build(BuildContext context) {
    print("Demo SetState Page ------");
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Demo StreamBuilder"),
        ),
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  StreamBuilder<int>(stream: streamcontroller.stream,
                      initialData: 0,
                      builder: (context, snapshot){
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(color: Colors.blueAccent) ,
                        );
                      }),
                  FloatingActionButton(
                    child:
                      Icon(Icons.add),
                        onPressed:(){
                        streamcontroller.sink.add(dem++);
                      }
                  )
              ],
        ),
      ),
      )
    );
  }


}
