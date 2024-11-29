import 'package:flutter/material.dart';
import 'package:latihan_api_demo/bloc/product_bloc.dart';

class ProductHomepage extends StatelessWidget {
  const ProductHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: BlocProvider(
        create: (context) =>
        ProductBloc()
          ..add(GetProductsEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator(),)
            } else if (state is ProductError) {
              return Center(child: Text(state.message),);
            } else if (state is ProductLoaded) {
              debugPrint('Products : ${state.productResponse.listProduct}');
              return ListView();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
