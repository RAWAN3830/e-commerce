import 'package:e_commerce/core/constant/extension.dart';
import 'package:e_commerce/infra/provider/order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_card_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderDetailProvider>(context, listen: false).AllOrderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<OrderDetailProvider>(
        builder: (context, value, child) {
          return (value.orderedProductList.isEmpty)
              ? const Center(child: Text('No data'))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.orderedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(context, target: OrderProductCard(
                          orderProduct:
                          value.orderedProductList[index].products,
                        ));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: context.screenHeight(context) * .10,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                    value.orderedProductList[index]
                                        .userEmail ??
                                        '',
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }
}
