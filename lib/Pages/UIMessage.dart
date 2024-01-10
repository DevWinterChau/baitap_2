import 'dart:convert';
import 'dart:math';

import 'package:dart/widget/SearchDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/UserModel.dart';
import '../Models/UserModelList.dart';
import '../widget/AvatarWidget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Khai báo list UserModel
  List<UserModel>? listuser;
  @override
  void initState() {
    super.initState();
    // initializeData();
  }
  Future<void> initializeData() async {
    try {
      final json = await rootBundle.loadString(assetskey);
      final decodedData = jsonDecode(json);
      if (decodedData != null && decodedData['result'] != null) {
        /*
        List<UserModel> userList = (decodedData['result'] as List<dynamic>)
            .map((userData) =>
            UserModel.fromJson(userData as Map<String, dynamic>))
            .toList();
        */

        // Creating a UserModelList instance from the JSON response
        UserModelList userModelList = UserModelList.fromJson(decodedData);
        // Accessing the list of UserModel instances
        List<UserModel>? userList2 = userModelList.result;
        setState(() {
          // set lại giá trị listuser để cập nhật lại UI
          listuser = userList2;
        });
      }
    }catch (error) {
      // Handle any potential errors
      print("Error initializing data: $error");
    }
  }
  // Đường dẫn local ảnh
  String assetskey = "assets/user/user_data.json";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body:
        //Check nếu listuser null hoặc rỗng thì hiện button và load
        listuser == null || listuser!.isEmpty
            ?
        Center(
          child: Column(
            children: [
              CircularProgressIndicator(color: Colors.white,),
              ElevatedButton(
                onPressed: () {
                  initializeData();
                },
                child: const Text("Load JSON from Assets"),
              )
            ],
          ),
        ):
        Container(
          child: Container(
              margin: EdgeInsets.all(16.0), // Add left margin to the Container
              child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Tìm kiếm
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white, // Adjust the background color as needed
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                    onTap: () {
                                      showSearch(context: context, delegate: SearchSomethinDelegate());
                                },
                                  child: Text(
                                    "Search...",

                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      // Add other text styles as needed
                                    ),
                                  ),
                                  ),
                                  ),
                                  IconButton(
                                    color: Colors.blueGrey,
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      // Handle the search action here
                                      showSearch(context: context, delegate: SearchSomethinDelegate());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Message
                    Expanded(flex:1,
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: EdgeInsets.only(top: 5),
                        child:Text("Message",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            //   fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    //List View ngang
                    Expanded(flex:2 ,child:
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listuser?.length ?? 0,
                      itemBuilder: (context, index) {
                        UserModel? user = listuser?[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [

                              AvatarWidget(
                                imageUrl: user?.avt ?? '', // Assuming 'avt' is the avatar URL in UserModel
                                size: 60,
                              ),
                              SizedBox(height: 6,),
                              Text(
                                user?.name ?? '', // Assuming 'name' is the user's name in UserModel
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                    ),
                    //List view dọc
                    Expanded(flex: 14,child:
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: listuser!.length ?? 0,
                        itemBuilder: (context, index) {
                          int randomNumber = Random().nextInt(61);
                          UserModel? usermodel = listuser![index];
                          return Padding(
                            padding: EdgeInsets.only(right: 16, bottom: 5, top: 0),
                            child:
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      AvatarWidget(
                                        imageUrl: usermodel!.avt! ?? '',
                                        size: 60,
                                        number: randomNumber > 0 ? "$randomNumber p" : null,
                                        sizetext: 6,
                                      ),
                                      SizedBox(width: 10),
                                      // Add vertical spacing of 10 pixels
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            usermodel!.name! ?? 'No name',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            "Bạn có tin nhắn mới ...",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      // Đẩy "Now" về cuối hàng
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment .start,
                                        children: [
                                          Text(
                                            "Now",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(color: Color(0xFF808080)),
                                  // Thêm Divider dưới mỗi item
                                ],
                              ),
                            ),
                          )
                          ;
                        }
                    ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }


}
