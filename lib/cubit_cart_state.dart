part of 'cubit_cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class AddedToCardstate extends CartState{
  List CardProducts=[];
  double TotalPrice;
  List<int> quantity;
  AddedToCardstate({required this.CardProducts,required this.TotalPrice,required this.quantity});

}
