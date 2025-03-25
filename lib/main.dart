import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai/ProductCard.dart';
import 'package:hava_havai/crat_page.dart';
import 'package:hava_havai/product.dart';
import 'package:hava_havai/shopping_cubit.dart';

import 'cubit_cart_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=>ShoppingCubit()),
      BlocProvider(create: (context)=>CartCubit())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void initState() {
    context.read<ShoppingCubit>().fetchProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Center(child: Text('Catalogue', style: TextStyle(fontSize: 24))),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CratPage()));
            },
          ),
        ],
      ),
      body: BlocBuilder<ShoppingCubit, ShoppingState>(
        builder: (context, state) {
          if (state is Successfullstate) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context,index){
                Product product=state.products[index];
                return ProductCard(product: product);
              }
            );
          }
          return Center(
            child: Text(
              'Welcome to the Catalog',
            ),
          );
        },
      ),
    );
  }
}
