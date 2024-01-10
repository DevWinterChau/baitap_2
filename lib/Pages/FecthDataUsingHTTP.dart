import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../Models/RamdomUser.dart';
import '../widget/AvatarWidget.dart';
import '../widget/AvtUerRandomWidget.dart';


class FethDataUsingHttp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FethDataUsingHttpPage(),
    );
  }
}
class FethDataUsingHttpPage extends StatefulWidget {
  @override
  _FethDataUsingHttpPageState createState() => _FethDataUsingHttpPageState();
}

class _FethDataUsingHttpPageState extends State<FethDataUsingHttpPage> {
  final Dio dio = Dio();
  String selectedValue = "10"; // Default selected value
  List<Results>? listUserRandom;
  List<String> listSelect = ["10","20", "30","40"];
  @override
  void initState() {
    super.initState();
  }
  //Lấy ngẫu nhiên 10 userRandom
  Future<void> _fectDataUsinghttp(String number) async {
    try {
      //GET Method
      final response = await dio.get('https://randomuser.me/api/?results=$number');
      if (response.statusCode == 200) {
        print(response);
        RandomUser user = await RandomUser.fromJson(response.data);
        setState(() {
          listUserRandom = user.results!;
        });
      } else {
        print('Error: ${response.statusCode}, ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Fetch Data Using HTTP"),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child:
                  Column(
                    children: [
                      ElevatedButton(
                      onPressed:() async{
                        await _fectDataUsinghttp(selectedValue);
                      },
                      child: Text("Fetch Data Using Dio"),
                      ),
                      Text("Chọn số lượng cần fetch...",style: TextStyle(color: Colors.blue, fontSize: 10),),
                      DropdownButton<String>(
                        value: selectedValue,
                        items: listSelect.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            // Perform any additional actions when the value changes
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            Flexible(
              flex: 5,
              child: listUserRandom != null && listUserRandom!.isNotEmpty
                  ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listUserRandom!.length,
                itemBuilder: (context, index) {
                  Results? user = listUserRandom![index];
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: ActUserRandomWiget(
                      UrlImage: user.picture!.large!,
                      Name: user.name!.first! + " " + user.name!.last!,
                      Email: user.email!,
                      Phone: user.phone!,
                    ),
                  );
                },
              )
                  : SizedBox(),
            ),
          ],
        )
      ),
    );
  }
}