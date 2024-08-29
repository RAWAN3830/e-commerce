import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        title:Text('Cart',style: TextStyle(color: Colors.white,fontSize: 20)),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: double.infinity,
                      width: 150,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('T-Shirt',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('Men Straight Fit Pure ',style: TextStyle(fontSize: 15),),
                        SizedBox(height: 10,),
                        Text('\$ 1.99',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(CupertinoIcons.add_circled_solid,color: Colors.black,size: 20),
                            SizedBox(width: 10,),
                            Text('0',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.minus_circle_fill,color: Colors.black,size: 20)

                          ],
                        ),
                        SizedBox(height: 10,),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '7 days',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' return available',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,))

                            ])),
                        ],
                    ),
                  )
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: Container(height: 50,
                width: double.infinity,
               decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [
                      Icon(CupertinoIcons.tag,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text('Apply Coupon',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

                    ],),
                    Icon(Icons.navigate_next_outlined,color: Colors.black,size: 30,),
                  ],),
                )),
              ),
              Container(
                height: 225,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 5,),
                        child: Text('PRICE DETAILS (3 Items)',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                      ),
                      Divider(height: 10,color: Colors.grey.shade200,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total MRP',style: TextStyle(fontSize: 15),),
                          Text('\$ 1700',style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount on MRP',style: TextStyle(fontSize: 15),),
                          Text('- \$ 170',style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coupon Discount',style: TextStyle(fontSize: 15),),
                          Text('Apply Coupon',style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping Fee',style: TextStyle(fontSize: 15),),
                          Text('FREE',style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(height: 10,color: Colors.grey.shade200,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 5,),
                            child: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 5,),
                            child: Text('\$ 1034',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

              ),
              SizedBox(height: 10,),
              Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text('PLACE ORDER',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
