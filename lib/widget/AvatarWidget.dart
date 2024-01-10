import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String? number;
  final double? sizetext;
  AvatarWidget({required this.imageUrl, required this.size, this.number = null, this.sizetext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
           Container(
             child: Column(
               children: [
                 ClipOval(
                   child: Image.asset(
                     imageUrl,
                     width: size,
                     height: size,
                     fit: BoxFit.cover,
                   ),
                 ),
               ],
             ),
           ),
            Positioned(
              bottom: 0, // Adjust this value based on your layout
              right: 0, // Adjust this value based on your layout
              child: ClipOval(
                child:
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(1),
                  child: ClipOval(
                    child: number != null
                        ? Container(
                      padding: EdgeInsets.all(4), // Add padding for better appearance
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        number!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizetext!,
                        ),
                      ),
                    )
                        : Container(
                      height: 15,
                      width: 15,
                      color: Colors.green,
                    ),
                  ),
                )
                ),
            ),
          ],
        )
       
      ],
    );
  }
}
