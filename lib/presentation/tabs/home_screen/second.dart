import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CartProvider>(context,listen: false).getCartProducts();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('hello 2'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: value.cartProducts.length,
            itemBuilder: (context, index) {
              return productModelCard(
                product: value.cartProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}
