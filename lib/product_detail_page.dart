import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(
                product['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Product Name
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Rating Icon (dummy icon in this example)
            Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Product Description (example description)
            const Text(
              'This is an amazing plant that can beautify your home and improve air quality. It requires minimal care and is perfect for indoor settings.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Product Price
            Text(
              'Price: ${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Buy Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show snackbar on successful purchase
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Purchase of ${product['name']} successful!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Buy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
