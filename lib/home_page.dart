import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import 'profile_page.dart';
import 'login_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPages(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;
  HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Plant 1',
      'image': 'assets/icons.png', // Menggunakan gambar dari assets
      'price': '\$10.00',
    },
    {
      'name': 'Plant 2',
      'image': 'assets/icons.png', // Menggunakan gambar dari assets
      'price': '\$15.00',
    },
    {
      'name': 'Plant 3',
      'image': 'assets/icons.png', // Menggunakan gambar dari assets
      'price': '\$12.00',
    },
    {
      'name': 'Plant 4',
      'image': 'assets/icons.png', // Menggunakan gambar dari assets
      'price': '\$17.00',
    },
    {
      'name': 'Plant 5',
      'image': 'assets/icons.png', // Menggunakan gambar dari assets
      'price': '\$12.00',
    },
  ];

  // List of promotional poster URLs
  final List<String> promotionalPosters = [
    'assets/icons.png',
    'assets/icons.png',
    'assets/icons.png',
    'assets/icons.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage(
                    username: username); // Pass username to ProfilePage
              }));
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // Horizontal ListView for promotional posters
          SizedBox(
            height: 150, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: promotionalPosters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      promotionalPosters[index],
                      fit: BoxFit.cover,
                      width: 150, // Width of each poster
                    ),
                  ),
                );
              },
            ),
          ),
          
          Text(
                "Welcome, $username !!",
                style: const TextStyle(fontSize: 14),
              ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dua produk dalam satu baris
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            product['image'], // Changed to Image.asset for local assets
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(product['price']),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetailPage(product: product);
              }));
            },
            child: const Text("Buy"),
          ),
        ],
      ),
    );
  }
}
