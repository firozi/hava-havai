import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai/cart_card.dart';
import 'package:hava_havai/cubit_cart_cubit.dart';
import 'package:hava_havai/product.dart';
import 'package:hava_havai/shopping_cubit.dart';

class CratPage extends StatefulWidget {
  const CratPage({Key? key}) : super(key: key);

  @override
  _CratPageState createState() => _CratPageState();
}

class _CratPageState extends State<CratPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
          if (state is AddedToCardstate) {
            return ListView.builder(
                itemCount: state.CardProducts.length,
                itemBuilder: (context, index) {
                  Product product=state.CardProducts[index];
                  return ProductCartCard(product: product);
                });
          }
          return Center(
            child: Text("Cart empty"),
          );
        },
      ),
    );
  }
}
