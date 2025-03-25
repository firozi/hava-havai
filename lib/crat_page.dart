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
        backgroundColor: Colors.pink[100],
        title: Text("Shopping Cart"),
      ),
      body: BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
          if (state is AddedToCardstate) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.CardProducts.length,
                      itemBuilder: (context, index) {
                        Product product=state.CardProducts[index];
                        return ProductCartCard(product: product,index:index,quent: state.quantity[index],);
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink[600], // Slightly darker shade
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "\$${state.TotalPrice.toStringAsFixed(2) ?? '0'}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pink[600],
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                        child: Text(
                          "BUY NOW",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
            child: Text("Cart empty"),
          );
        },
      ),
    );
  }
}
