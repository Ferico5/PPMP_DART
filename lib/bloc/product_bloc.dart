import 'package:bloc/bloc.dart';
import 'package:latihan_api_demo/repository/product_repository.dart';
import 'package:latihan_api_demo/response/product_response.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productRepository = ProductRepository();
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoading());
      try{
        ProductResponse response = await productRepository.getProducts();
        emit(ProductLoaded(productResponse: response));
      }on Exception catch(e){
        emit(ProductError(message: e.toString()));
      }
    });
  }
}