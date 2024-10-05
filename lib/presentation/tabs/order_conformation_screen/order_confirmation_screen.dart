import 'package:e_commerce/core/constant/extension.dart';
import 'package:flutter/material.dart';
import '../../../domain/orderdetail.dart';
import '../home_screen/product_card.dart';
import '../tabbar_screen/tab_bar.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({
    super.key,
    required this.orderDetails,
  });

  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushAndRemoveUntil(
            context,
            target: const TabBarScreen(),
          );
        },
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Order confirmation"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Id : ${orderDetails.orderId}'),
              Text('Order Value : ${orderDetails.orderValue}'),
              Text('Time of order : ${orderDetails.timeStamp}'),
              Text('Email : ${orderDetails.userEmail}'),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: orderDetails.products.length,
                itemBuilder: (context, index) => productModelCard(
                  product: orderDetails.products[index],
                ),
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}