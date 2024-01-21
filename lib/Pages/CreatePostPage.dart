import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:overlay_support/overlay_support.dart';

class YourPage extends StatefulWidget {
  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  List<PlatformFile> selectedFiles = [];

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'], // Specify allowed file extensions
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        selectedFiles = result.files;
      });
    }else{
      toast("Vui lòng chọn ảnh ...");
    }
  }

  Future<void> sendRequest() async {
    final Uri uri = Uri.parse('https://localho/createpost');
    final Map<String, dynamic> map = {
      "postRequest": {
        "title": "Sample Title",
        "content": "Sample Content"
      },
      "files": [
        selectedFiles
      ]  // Placeholder for file data
    };

    // Add file data to the map
    for (var file in selectedFiles) {
      List<int> fileBytes = await file.bytes!.toList();
      String base64String = base64Encode(fileBytes);
      map["files"].add({"fileData": base64String, "fileName": file.name});
    }

    // Send the request as before
    http.Response response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(map),
    );

    // Handle the response...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickFiles,
              child: Text('Chọn file'),
            ),
            SizedBox(height: 16),
            Text('Các file được đăng: ${selectedFiles.length}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: sendRequest,
              child: Text('Đăng'),
            ),
          ],
        ),
      ),
    );
  }
}
