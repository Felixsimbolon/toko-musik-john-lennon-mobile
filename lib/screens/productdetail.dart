import 'package:flutter/material.dart';
import 'package:toko_musik_john_lennon/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product}); // Use required named parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.item),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              product.fields.pictureLink.isNotEmpty
                  ? Image.network(
                      product.fields.pictureLink,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const Text(
                      'No Image Available',
                      style: TextStyle(color: Colors.grey),
                    ),
              const SizedBox(height: 20),
              // Product Name
              Text(
                product.fields.item,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Product Price
              Text(
                "Price: \$${product.fields.price}",
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              // Product Description
              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.fields.description,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
