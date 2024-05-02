import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int? userId;
  const CartScreen({super.key, this.userId});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.userId}"),
      ),
    );
  }
}
