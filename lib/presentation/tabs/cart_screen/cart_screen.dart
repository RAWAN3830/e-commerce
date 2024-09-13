import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/api_provider.dart';
import '../../../domain/model_class.dart';

class CartScreen extends StatefulWidget {
  final String id;
  const CartScreen({super.key,required this.id});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context,listen: false).providerProductByCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    ProductModel? pm;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
              Consumer<ApiProvider>(
                  builder: (context,product,child) {
                    return GridView.builder(
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: product.productByCategory.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          mainAxisExtent: height * .38,
                          crossAxisCount: 2,
                          mainAxisSpacing: 16),
                      itemBuilder: (context, index) =>
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => DiscriptionScreen(products: pm,)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                            NetworkImage(product.productByCategory[index].image ?? ''),fit: BoxFit.contain),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: height * .18,
                                      width: MediaQuery.sizeOf(context).width,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,bottom:5),
                                  child: Text(
                                    product.productByCategory[index].category ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,bottom:5),
                                  child: Text(
                                    product.productByCategory[index].title ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:15,bottom:5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '\$ ${product.productByCategory[index].price}',
                                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15,bottom:5),
                                  child: Container(
                                    height: height * 0.025,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Icon(CupertinoIcons.star_fill,size: 14,color: Colors.white,),
                                        Text(
                                          ' ${product.productByCategory[index].rating?.rate}',
                                          style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
              Container(
                height: 225,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white
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
                      Divider(height: 10,color: Colors.grey.shade200,),

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

              ),
              const SizedBox(height: 10,),
              Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                  child: const Center(
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
