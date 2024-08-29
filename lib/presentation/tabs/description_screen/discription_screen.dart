import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/model_class.dart';

class DiscriptionScreen extends StatefulWidget {
  final String? id;
  final String? title;
  final String? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  const DiscriptionScreen({super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating});

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
            icon: Icon(
              CupertinoIcons.back,
              size: 20,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: Text('Discription',
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
                 image:DecorationImage(image: NetworkImage(widget.image??'')))),
              ),
              Text(widget.title??'',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),

              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'MRP   ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\$ ${widget.price}',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,))

                  ])),

              Text('price inclusive of all texes',style:TextStyle(fontSize: 18)),
              SizedBox(height: 15,),
              Text(widget.description??'',style:TextStyle(fontSize: 20,color: Colors.black)),

              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text('ADD TO CART',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 18)),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(icon:Icon(CupertinoIcons.heart,size: 28,color: Colors.black,),onPressed: (){}),
                  ),
                ],
              ),
              
              Text('Discription')

            ],
          ),
        ),
      ),
    );
  }
}
