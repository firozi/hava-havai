

import 'package:bloc/bloc.dart';
import 'package:hava_havai/product.dart';
import 'package:meta/meta.dart';

part 'cubit_cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  double price=0;
  List<Product>cart=[];
  List<int> quantity=[];
  void addToCart(Product product) {
    if (!cart.contains(product)) {
      double Price=product.discountedPrice;
      quantity.add(1);
      price=price+Price;
      cart.add(product);
      print(cart);
      emit(AddedToCardstate(CardProducts: cart,TotalPrice: price,quantity:quantity));// Emit new state
    }
  }
  void addQuentity(double Price,int index){
    quantity[index]++;

    price=price+Price;
    emit(AddedToCardstate(CardProducts: cart,TotalPrice: price,quantity:quantity));
  }
  void decreaseQuentity(double Price,int index){
    if (quantity[index]>0) {
     quantity[index]--;
      price=price-Price;
      emit(AddedToCardstate(CardProducts: cart,TotalPrice: price,quantity:quantity));
    }

  }
}
