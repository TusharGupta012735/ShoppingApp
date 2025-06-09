import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String Title;
  final double price;
  final String ImageUrl;
  final Color bgcolor;
  const ProductCard({
    super.key,
    required this.Title,
    required this.price,
    required this.ImageUrl,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: bgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                Title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                '$price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Image(image: AssetImage(ImageUrl)),
            ),
          ],
        ),
      ),
    );
  }
}
