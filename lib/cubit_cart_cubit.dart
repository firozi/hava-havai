import 'package:bloc/bloc.dart';
import 'package:hava_havai/product.dart';
import 'package:meta/meta.dart';

part 'cubit_cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Product>cart=[];
  void addToCart(Product product) {
    if (!cart.contains(product)) {
      cart.add(product);
      print(cart);
      emit(AddedToCardstate(CardProducts: cart)); // Emit new state
    }

  }
}
