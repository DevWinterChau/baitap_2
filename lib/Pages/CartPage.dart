import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/Cart.dart';
import '../Models/ProductModel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Giỏ hàng '),
        ),
        body: Column(
          children: [
            Expanded(
              child: ProductList(),
            ),
            Divider(),
            Expanded(
              child: ShoppingCart(),
            ),
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
  late Future<Product?> productFuture;

  @override
  void initState() {
    super.initState();
    productFuture =  Product.initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // hoặc một widget tương tự cho trạng thái loading
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.result == null) {
          return Text('No data available');
        } else {
          // Dữ liệu đã sẵn sàng, xây dựng giao diện người dùng ở đây
          Product productList = snapshot.data!;
          return Consumer<Cart>(
            builder: (context, cart, child) {
              return ListView.builder(
                itemCount: productList.result!.length,
                itemBuilder: (context, index) {
                  final product = productList.result![index];
                  return ListTile(
                    leading: Image.asset(
                      product!.image!,  // Replace with the actual URL or path of your image
                      width: 50,         // Set the desired width
                      height: 50,        // Set the desired height
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                    title: Text(product.name!),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cart.addItem(product);
                      },
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}


class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return ListTile(
              title: Text(item!.name!),
              subtitle: Text('\$${item.price} x ${item.Quantity}'),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  cart.removeItem(index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
