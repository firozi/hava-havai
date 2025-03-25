import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai/cubit_cart_cubit.dart';
import 'package:hava_havai/main.dart';
import 'package:hava_havai/product.dart';
import 'package:hava_havai/shopping_cubit.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.product.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),

            // Brand Name & Title
            Text(
              widget.product.brand,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            Text(
              widget.product.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),

            // Price & Discount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.product.discountedPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Text(
                  "\$${widget.product.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: Colors.grey),
                ),
                Text(
                  "-${widget.product.discountPercentage}%",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  context.read<CartCubit>().addToCart(widget.product);
                },
                child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
