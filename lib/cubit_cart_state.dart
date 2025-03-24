part of 'cubit_cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class AddedToCardstate extends CartState{
  List CardProducts=[];
  AddedToCardstate({required this.CardProducts});

}
