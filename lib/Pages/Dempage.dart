import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Models/Cart.dart';
import '../Models/CartItme.dart';
import '../Models/ProductModel.dart';
import '../Models/RamdomUser.dart';

class DemoFuttureBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Futture Builder'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ProductList(),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}


class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Dio dio = Dio();

  //Lấy ngẫu nhiên 10 userRandom
  Future<List<Results>?> _fectDataUsinghttp(String number) async {
    try {
      //GET Method
      final response = await dio.get('https://randomuser.me/api/?results=$number');
      if (response.statusCode == 200) {
        print(response);
        RandomUser user = await RandomUser.fromJson(response.data);
        return user.results;
      } else {
        print('Error: ${response.statusCode}, ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Results>?>(
      future: _fectDataUsinghttp("5"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // hoặc một widget tương tự cho trạng thái loading
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data! == null) {
          return Text('No data available');
        } else {
          // Dữ liệu đã sẵn sàng, xây dựng giao diện người dùng ở đây
          final productList = snapshot.data!;
              return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList![index];
                  return ListTile(
                    leading: Image.network(
                      product!.picture!.large!,  // Replace with the actual URL or path of your image
                      width: 50,         // Set the desired width
                      height: 50,        // Set the desired height
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                    title: Text(product!.name!.first!),
                    subtitle: Text('\$${product!.email!}'),
                  );
                },
              );
        }
      },
    );
  }
}


