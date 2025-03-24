import 'package:flutter/material.dart';

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
      body:Center(
        child: Text("Cart"),
      ) ,
    );
  }
}
