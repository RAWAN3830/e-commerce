import 'package:e_commerce/infra/provider/payment_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../infra/provider/api_provider.dart';
import '../../../infra/provider/cart_provider.dart';
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
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       CupertinoIcons.back,
        //       color: Colors.white,
        //     )),
        title:const Text('Cart',style: TextStyle(color: Colors.white,fontSize: 20)),

      ),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (context,value,child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Column(
                    children: [

                          value.isLoading ? const Center(child: CircularProgressIndicator(),)
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
                              child: Consumer<CartProvider>(
                                builder: (context,value,child) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                        padding: const EdgeInsets.only(top: 10,bottom: 5,),
                                        child: Text('PRICE DETAILS (${value.cartData.length} Item)',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                                      ),
                                      Divider(height: 10,color: Colors.grey.shade200,),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total MRP',style: TextStyle(fontSize: 15),),
                                          Text(value.totalCartValue.toStringAsFixed(2),style: const TextStyle(fontSize: 15),)
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

                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10,bottom: 5,),
                                            child: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10,bottom: 5,),
                                            child: Text(value.totalCartValue.toStringAsFixed(2),style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
                                          ),
                                        ],
                                      ),

                                    ],
                                  );
                                }
                              ),
                            ),

                          );
                        }
                      ),
                      const SizedBox(height: 10,),
                      Consumer<PaymentProvider>(
                        builder: (context,payment,child) {
                          return MyButton(onTap: () {
                            payment.getPayments(amount: int.parse(value.totalCartValue.toStringAsFixed(0)));
                          }, text: 'PLACE ORDER',);
                        }
                      )
                     
                    ],
                  ),

            );
          }
        ),
      ),
    );
  }
}
