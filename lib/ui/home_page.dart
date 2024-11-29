import 'package:flutter/material.dart';
import 'package:latihan_api_demo/models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void initState() {
    futureProduct = productRepository.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Api Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(future: futureProduct, builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(itemCount: snapshot.data!.listProduct.length, itemBuilder: (context, index) {
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
          });
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
