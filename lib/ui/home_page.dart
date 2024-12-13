import 'package:flutter/material.dart';
import 'package:latihan_api_demo/models/product_model.dart';
import 'package:latihan_api_demo/repository/product_repository.dart';
import 'package:latihan_api_demo/response/product_response.dart';

class HomePage extends StatefulWidget {  // Change to StatefulWidget to use initState
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ProductResponse> futureProduct;  // Declare the future variable

  @override
  void initState() {
    super.initState();
    // Assuming `productRepository.getProducts()` is a method to fetch product data
    // futureProduct = productRepository.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Api Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<ProductResponse>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.listProduct.length,
              itemBuilder: (context, index) {
                ProductModel productModel = snapshot.data!.listProduct[index];
                debugPrint(productModel.title);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(productModel.id.toString()),
                  ),
                  title: Text(productModel.title),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.stock.toString()),
                      Text(productModel.price.toString()),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
