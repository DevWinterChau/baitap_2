import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/UserModel.dart';
import '../Models/UserModelList.dart';

class SearchSomethinDelegate extends SearchDelegate<String> {
  late List<UserModel> listuser;
  SearchSomethinDelegate() {
    // Khởi tạo dữ liệu
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      final json = await rootBundle.loadString("assets/user/user_data.json");
      final decodedData = jsonDecode(json);
      if (decodedData != null && decodedData['result'] != null) {
        UserModelList userModelList = UserModelList.fromJson(decodedData);
        List<UserModel> userList = userModelList.result!;
        listuser = userList;
      }
    } catch (error) {
      print("Error initializing data: $error");
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search functionality here
    final results = listuser.where((user) =>
        user.name!.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final user = results.elementAt(index);
        return
            results.length > 0?
            Center(
              child:
                ListTile(
                  subtitle: Text(user.email!, style: TextStyle(color: Colors.blueAccent),),
                  title: Text(user.name!, style: TextStyle(color: Colors.blueAccent),),
                ),
            ):ListTile(
            title: Text("Không tìm thấy ..." ,style: TextStyle(color: Colors.redAccent),),
          );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types
    final suggestions = listuser.where((user) =>
        user.name!.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final user = suggestions.elementAt(index);
        return  ListTile(
          subtitle: Text(user.email!, style: TextStyle(color: Colors.blueAccent),),
          title: Text(user.name!, style: TextStyle(color: Colors.blueAccent),),
        );
      },
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the AppBar (e.g., clear text, voice search)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    // Leading widget (e.g., back button)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "null"); // Close the search interface
      },
    );
  }
}
