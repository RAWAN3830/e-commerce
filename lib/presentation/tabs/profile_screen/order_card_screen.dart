import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/model_class.dart';
import '../home_screen/product_card.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({super.key,required this.orderProduct});
  final List<ProductModel> orderProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products '),
      ),
      body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: orderProduct.length,
        itemBuilder: (context, index) {
          return productModelCard(
            product: orderProduct[index],
            showDeleteIcon: true,
          );
        },
      ),
    ),
    );
  }
}