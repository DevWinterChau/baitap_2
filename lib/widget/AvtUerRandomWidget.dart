import 'package:dart/Models/RamdomUser.dart';
import 'package:flutter/material.dart';

class ActUserRandomWiget extends StatelessWidget{
  String? Name;
  String? Email;
  String? UrlImage;
  String? Phone;
  ActUserRandomWiget({ this.UrlImage = "", required this.Name, this.Email  = "Chưa có", this.Phone = "Chưa có"});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.network(
                UrlImage!, // Assuming imageUrl is the variable for the image URL
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15), // Add some space between the image and text
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Name!, // Assuming name is the variable for the user's name
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                  maxLines: 1,
                ),
                Text(
                  "Phone: $Phone", // Assuming phone is the variable for the phone number
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "Email: $Email", // Assuming email is the variable for the email address
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }

}