import '../models/product_model.dart';

class ProductResponse{
  List<ProductModel> listProduct = [];

  ProductResponse.fromJson(json){
    for(int i = 0; i < json.length;i++){
      ProductModel productModel = ProductModel.fromJson(json[i]);
      listProduct.add(productModel);
    }
  }
}