part of 'shopping_cubit.dart';

@immutable
sealed class ShoppingState {}

final class ShoppingInitial extends ShoppingState {}

final class Successfullstate extends ShoppingState{
  List products = [];
  Successfullstate({required this.products});
}
final class AddedToCardstate extends ShoppingState{
  List CardProducts=[];
  AddedToCardstate({required this.CardProducts});

}