import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/model_class.dart';

class DiscriptionScreen extends StatefulWidget {
  final ProductModel products;
  // final String? id;
  // final String? title;
  // final String? price;
  // final String? description;
  // final String? category;
  // final String? image;
  // final Rating? rating;
  const DiscriptionScreen({super.key,
    required this.products
    // required this.id,
    // required this.title,
    // required this.price,
    // required this.description,
    // required this.category,
    // required this.image,
    // this.rating
  });

  @override
  State<DiscriptionScreen> createState() => _DiscriptionScreenState();
}

class _DiscriptionScreenState extends State<DiscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              size: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom:8),                child: Container(height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                 image:DecorationImage(image: NetworkImage(widget.products.image??'')))),
              ),
              Text(widget.products.title??'',style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),

              RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: 'MRP   ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\$ ${widget.products.price}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,))

                  ])),

              const Text('price inclusive of all texes',style:TextStyle(fontSize: 18)),
              const SizedBox(height: 15,),
              Text(widget.products.description??'',style:const TextStyle(fontSize: 20,color: Colors.black)),

              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 320,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: const Center(
                          child: Text('ADD TO CART',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 18)),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(icon:const Icon(CupertinoIcons.heart,size: 28,color: Colors.black,),onPressed: (){}),
                  ),
                ],
              ),
              
              const Text('Discription')

            ],
          ),
        ),
      ),
    );
  }
}
