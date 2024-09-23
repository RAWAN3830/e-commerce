import 'package:e_commerce/core/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/cart_provider.dart';
import '../../registration/common_widgets/button.dart';
import 'cart_card.dart';

class CartScreen extends StatefulWidget {

   const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context,listen: false).getDataFromCart();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        title:const Text('Cart',style: TextStyle(color: Colors.white,fontSize: 20)),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             Consumer<CartProvider>(
               builder: (context,value,index) {
                 return value.isLoading ? const Center(child: CircularProgressIndicator(),)
                 :
                 ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   scrollDirection: Axis.vertical,
                   itemCount: value.cartData.length,
                   itemBuilder: (context, index) {
                     // return productModelCard(
                     //   product: value.cartData[index],
                     //   showDeleteIcon: true,
                     // );
                     return CartCard(
                       product: value.cartData[index],
                     );
                   },
                 );
               }
             ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: Container(height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
              Consumer<ApiProvider>(
                builder: (context,value,child) {
                  return Container(
                    height: height * 0.28,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: value.getTheme == true ? Colors.black : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 5,),
                            child: Text('PRICE DETAILS (3 Items)',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                          ),
                          Divider(height: 10,color: Colors.grey.shade200,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total MRP',style: TextStyle(fontSize: 15),),
                              Text('\$ 1700',style: TextStyle(fontSize: 15),)
                            ],
                          ),
                          const SizedBox(height: 8,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount on MRP',style: TextStyle(fontSize: 15),),
                              Text('- \$ 170',style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Coupon Discount',style: TextStyle(fontSize: 15),),
                              Text('Apply Coupon',style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipping Fee',style: TextStyle(fontSize: 15),),
                              Text('FREE',style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Divider(height: 10,),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 5,),
                                child: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 5,),
                                child: Text('\$ 1034',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                  );
                }
              ),
              const SizedBox(height: 10,),
              MyButton(onTap: () {  }, text: 'PLACE ORDER',)
              // Container(
              //     height: 50,
              //     width: double.infinity,
              //     decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
              //     child: const Center(
              //       child: Text('PLACE ORDER',
              //           style: TextStyle(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16)),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
