import 'package:flutter/material.dart';
import 'package:hava_havai/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai/cubit_cart_cubit.dart';


class ProductCartCard extends StatefulWidget {
  final Product product;
  final int index;
  final int quent;

  const ProductCartCard({Key? key, required this.product,required this.index,required this.quent}) : super(key: key);

  @override
  _ProductCartCardState createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {


  void increment(double price) {
    context.read<CartCubit>().addQuentity(price,widget.index);
    setState(() {

    });
  }

  void decrement(double price) {
      context.read<CartCubit>().decreaseQuentity(price,widget.index);
      setState(() {

      });
    }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.product.image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "\$${widget.product.discountedPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "\$${widget.product.price.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "-${widget.product.discountPercentage}%",
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Increment & Decrement Buttons
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.red),
                  onPressed:(){
                    decrement(widget.product.discountedPrice);
                  },
                ),
                Text(
                  widget.quent.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
                  onPressed: (){
                    increment(widget.product.discountedPrice);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
