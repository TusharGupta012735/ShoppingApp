import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/product_details.dart';
import 'package:shop_app/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  static List<String> filters = ["All", "Nike", "Adidas", "Puma", "Reebok"];
  String selectedFilter = filters[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //top most heading and search row
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Shoes\nCollection",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),

        //list of options with all as default
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filters[index];
                    });
                  },
                  child: Chip(
                    backgroundColor:
                        selectedFilter == filters[index]
                            ? Colors.amberAccent[100]
                            : Colors.grey[300],
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text(
                      filters[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        //list of shoes
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final prod = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    // animation part
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              ProductDetails(product: prod),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                    // MaterialPageRoute(
                    //   builder: (context) => ProductDetails(product: prod),
                    // ),
                  );
                },
                child: ProductCard(
                  Title: prod['title'] as String,
                  price: prod['price'] as double,
                  ImageUrl: prod['imageUrl'] as String,
                  bgcolor: index % 2 == 0 ? Colors.blue[50]! : Colors.red[50]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
