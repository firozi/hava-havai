part of 'shopping_cubit.dart';

@immutable
sealed class ShoppingState {}

final class ShoppingInitial extends ShoppingState {}

final class Successfullstate extends ShoppingState{
  List products = [];
  Successfullstate({required this.products});
}
