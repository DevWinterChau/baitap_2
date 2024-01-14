
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:overlay_support/overlay_support.dart';

class SaveImagePage extends StatefulWidget {
  @override
  _SaveImagePageState createState() => _SaveImagePageState();
}

class _SaveImagePageState extends State<SaveImagePage> {
  String? src = null;
  late String? URL;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    URL = "https://i.pinimg.com/736x/33/eb/87/33eb87fec1633840d288abe570368dc6.jpg";
    _controller = TextEditingController(text: URL);
  }

  _saveNetworkImage() async {
    if(URL!.isEmpty){
      toast("Vui lòng nhập URl");
      setState(() {
        src = null;
      });
      return;
    }
    var response = await Dio().get(
        URL! ,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    if(result != null){
      toast("Tải thành công !");
      setState(() {
        src = URL!;
      });
    }
    else{
      toast("Đã xảy ra lỗi khi tải ảnh ...");
      setState(() {
        src = null;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Save Image"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            src != null ?
            Image.network(
              src!,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ):SizedBox(),
            TextField(
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  URL = text;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nhập URL dưới đây',
              ),
            ),
            ElevatedButton(
              onPressed: URL != null ? _saveNetworkImage
                  : (){ toast("Vui lòng nhập đường dẫn ảnh");},
              child: Text("Download..."),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            )
          ],)
        ),
      ),
    );
  }


}
