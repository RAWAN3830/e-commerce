import 'package:e_commerce/core/provider/api_provider.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/domain/model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  final ProductModel product;
  const CartCard({super.key, required this.product});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<ApiProvider>(builder: (context, value, child) {
            return Container(
              height: height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: .5,
                  ),
                  color: value.getTheme == true ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: double.infinity,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.product.image ?? ''))),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.category ?? '',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.product.title ?? '',
                            style: TextStyle(
                              fontSize: height * 0.013,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '\$ ${widget.product.price}',
                                style: TextStyle(
                                    fontSize: height * 0.023,
                                    fontWeight: FontWeight.bold),
                              ),
                              Consumer<CartProvider>(
                                  builder: (context, value, child) {
                                return IconButton(
                                  onPressed: () async {
                                    if (widget.product.id == null) return;
                                    await value
                                        .deleteFromCart(widget.product.id!);
                                    if (!context.mounted) return;
                                    await value.getDataFromCart();
                                  },
                                  icon: const Icon(CupertinoIcons.delete),
                                );
                              })
                            ],
                          ),
                          Consumer<CartProvider>(
                              builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    icon: Icon(CupertinoIcons.add_circled_solid,
                                        size: 22),
                                    onPressed: () async {
                                      await value.addToCart(widget.product);
                                      if (!context.mounted) return;
                                      await value.getDataFromCart();
                                    }),
                                SizedBox(width: width * 0.01),
                                Text(
                                  widget.product.quantity.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(width: width * 0.01),
                                IconButton(
                                    icon: Icon(CupertinoIcons.minus_circle_fill,
                                        size: 22),
                                  onPressed: () async {
                                    if (widget.product.id == null) return;
                                    await value
                                        .removeFromCart(widget.product.id!);
                                    if (!context.mounted) return;
                                    await value.getDataFromCart();
                                  },
                                ),
                              ],
                            );
                          }),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '7 days',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: ' return available',
                                style: TextStyle(
                                  fontSize: height * 0.018,
                                  color: Colors.deepOrange,
                                ))
                          ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );

  }
}
