import 'package:e_commerce/core/constant/extension.dart';
import 'package:e_commerce/domain/model_class.dart';
import 'package:e_commerce/presentation/tabs/description_screen/discription_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infra/provider/api_provider.dart';
import '../../../infra/provider/cart_provider.dart';

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
      padding: EdgeInsets.all(width * 0.01),
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
                        context.push(context,target: DiscriptionScreen(products: product));
                       },
                      child: Stack(
                        children: [
                          Container(
                            height: height * .19,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.024,
                                  width: width * 0.12,
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
                                        size: height * 0.02,
                                        color: (product.rating!.rate! <= 2)
                                            ? Colors.red
                                            : (product.rating!.rate! <= 3.5)
                                                ? Colors.orange
                                                : Colors.green,
                                      ),
                                      Text(
                                        ' ${product.rating?.rate}',
                                        style: TextStyle(
                                            fontSize: height * 0.018,
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
                                          icon:  Icon(CupertinoIcons.heart,
                                              size: height * 0.025),
                                          onPressed: () {})),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      product.category ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.019),
                    ),
                    Text(
                      product.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: height * 0.016,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:height * 0.01),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$ ${product.price}',
                            style: TextStyle(
                                fontSize: height * 0.021,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: height * 0.04,
                            width: width * 0.13,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: IconButton(
                                  onPressed: () async {
                                    await Provider.of<CartProvider>(
                                            context,
                                            listen: false)
                                        .addToCart(product);
                                  },
                                  icon:
                                      const Icon(CupertinoIcons.cart,color: Colors.black87,)),
                            ),
                          ),
                        ],
                      ),
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
