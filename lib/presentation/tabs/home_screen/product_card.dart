import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/domain/model_class.dart';
import 'package:e_commerce/presentation/tabs/description_screen/discription_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/api_provider.dart';

class productModelCard extends StatelessWidget {
  final ProductModel product;
  final bool showDeleteIcon;
  const productModelCard(
      {super.key, required this.product, this.showDeleteIcon = false});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<ApiProvider>(builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
              color: value.getTheme == true
                  ? const Color(0xff212529)
                  : Colors.white,
              border: Border.all(
                width: .5,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DiscriptionScreen(products: product)));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: height * .18,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(product.image ?? ''),
                                  fit: BoxFit.contain),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.020,
                                  width: width * 0.11,
                                  decoration: BoxDecoration(
                                      color: value.getTheme == true
                                          ? Colors.black87
                                          : Colors.white70,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 14,
                                        color: (product.rating!.rate! <= 2)
                                            ? Colors.red
                                            : (product.rating!.rate! <= 3.5)
                                                ? Colors.orange
                                                : Colors.green,
                                      ),
                                      Text(
                                        ' ${product.rating?.rate}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: value.getTheme == true
                                      ? Colors.black87
                                      : Colors.white54,
                                  radius: height * 0.020,
                                  child: Center(
                                      child: IconButton(
                                          icon: const Icon(CupertinoIcons.heart,
                                              size: 22),
                                          onPressed: () {})),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * .01),
                    Text(
                      product.category ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      product.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 14,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () async {
                              await Provider.of<CartProvider>(context,listen: false)
                                  .addToCart(product);
                            },
                            icon: const Icon(CupertinoIcons.cart)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
