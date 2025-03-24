import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hava_havai/product.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingInitial());
   List<Product> AllProduct=[];
List<Product>Cart=[];
   void fetchProducts()async{
     final response = await http.get(Uri.parse('https://dummyjson.com/products'));
     if (response.statusCode == 200) {
        final List<dynamic> products = json.decode(response.body)['products'];
         AllProduct= products.map((product)=>Product(title: product['title']??"no title", discountPercentage: (product['discountPercentage']?? 0).toDouble(), brand: product['brand']?? "Unkown brand", price: (product['price']?? 0).toDouble(), image: product['images'][0]??"no image", )).toList();
        emit(Successfullstate(products: AllProduct));
     } else {
       throw Exception('Failed to load products');
     }
   }

   void AddToCart(Product product){
     if(Cart.contains(product)){
       return null;
     }
     else{
       Cart.add(product);
       emit(AddedToCardstate(CardProducts: Cart));
     }

   }
}
