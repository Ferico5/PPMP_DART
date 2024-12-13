import 'package:flutter/material.dart';
import 'package:latihan_api_demo/response/product_response.dart';
import 'package:latihan_api_demo/repository/product_repository.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  final productRepository = ProductRepository();

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Latihan API Demo'),
          backgroundColor: Theme.of(context).primaryColor, // Menggunakan warna tema
        ),
        body: FutureBuilder<ProductResponse>(
            future: widget.productRepository.getProducts(),
            builder: (context, snapshot) {
              // Handling loading state
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              // Handling error state
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              // Handling successful data load
              else if (snapshot.hasData) {
                var products = snapshot.data!.listProduct;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(product.title), // Menampilkan nama produk (title)
                        subtitle: Text('Price: \$${product.price}\nStock: ${product.stock}'), // Menampilkan harga dan stok produk
                        isThreeLine: true,
                        leading: Icon(Icons.shopping_basket), // Ikon produk
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
        ),
    );
  }
}