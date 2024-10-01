import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model_class.dart';
import '../../../infra/provider/api_provider.dart';

class DiscriptionScreen extends StatefulWidget {
  final ProductModel products;

  const DiscriptionScreen({super.key, required this.products});

  @override
  State<DiscriptionScreen> createState() => _DiscriptionScreenState();
}


class _DiscriptionScreenState extends State<DiscriptionScreen> {
  double _currentRating = 0;


  @override
  void initState() {
    super.initState();
    _currentRating = widget.products.rating?.rate ?? 0; // Set initial rating from the product model
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              size: height * 0.03,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: const Text('Discription',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Container(
                    height: height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(widget.products.image ?? '')))),
              ),
        SizedBox(height: height * 0.01, ),
              RatingBar(
                filledIcon: CupertinoIcons.star_fill,size: height * 0.03,
                emptyIcon: Icons.star_border,
                onRatingChanged: (newRating) {
                  setState(() {
                    _currentRating = newRating;
                    // Update the product rating
                  });
                },
                isHalfAllowed: true,
                halfFilledIcon: CupertinoIcons.star_lefthalf_fill,
                maxRating: 5,
                initialRating: _currentRating, // Set initial rating from the widget
              ),
        SizedBox(height: height * 0.01, ),
              Text(widget.products.title ?? '',
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.w500)),
              SizedBox(height: height * 0.01, ),
              const Text('price inclusive of all texes',
                  style: TextStyle(fontSize: 18)),

               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                 Text('MRP ',style: TextStyle(fontSize: height * 0.015,fontWeight: FontWeight.w500)),
                 Text('\$ ${widget.products.price ?? ''}',style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.bold)),
                 ],
               ),

          SizedBox(height: height * 0.01, ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Consumer<ApiProvider>(builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          // value.addToCart(widget.products);
                        },
                        child: Container(
                            height: height * 0.06,
                            width: width * 0.7,
                            decoration: const BoxDecoration(
                             color: Colors.lightGreenAccent
                            ),
                            child:  Center(
                              child: Text('ADD TO CART',
                                  style: TextStyle(
                                    color:  value.getTheme == true ? Colors.black : Colors.black,
                                      fontSize: 18)),
                            )),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.heart,
                          size: 28,

                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(widget.products.description ?? '',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
