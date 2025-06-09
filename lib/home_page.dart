import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [ProductList(), CartPage()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: pages[currentPage],
        //to maintain the scroll position
        body: IndexedStack(index: currentPage, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedItemColor: Colors.amber[700],
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          ],
        ),
      ),
    );
  }
}
