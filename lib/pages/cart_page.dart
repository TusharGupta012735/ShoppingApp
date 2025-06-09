import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cart[index]["imageUrl"] as String),
              backgroundColor: Colors.amber[200],
              radius: 30,
            ),
            title: Text(
              cart[index]['title'] as String,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Size is ${cart[index]['size']}'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
