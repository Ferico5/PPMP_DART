part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetProductsEvent extends ProductEvent{}