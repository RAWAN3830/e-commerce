// import 'package:e_commerce/core/provider/api_provider.dart';
// import 'package:e_commerce/core/provider/cart_provider.dart';
// import 'package:e_commerce/domain/model_class.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CartCard extends StatefulWidget {
//   final ProductModel product;
//   const CartCard({super.key,required this.product});
//
//   @override
//   State<CartCard> createState() => _CartCardState();
// }
//
// class _CartCardState extends State<CartCard> {
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Column(
//       children: [
//         Consumer<ApiProvider>(
//           builder: (context,value,child) {
//             return Container(
//               height: height * 0.2,
//               width: double.infinity,
//               decoration:  BoxDecoration(border: Border.all(
//                 width: .5,
//               ),color: value.getTheme == true ? Colors.black : Colors.white),
//               child: Row(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: double.infinity,
//                     width: width  * 0.25,
//                     decoration: BoxDecoration(image:DecorationImage(image: NetworkImage(widget.product.image ?? ''))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(product.category ?? '',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                       Text(widget.product.title ?? '',style: TextStyle(fontSize:height * 0.013,),maxLines: 2),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text('\$ ${widget.product.price}',style: TextStyle(fontSize:  height * 0.02,fontWeight: FontWeight.bold),),
//                           IconButton(onPressed: () async{
//                             if(widget.product.id != null)
//                           }, icon: Icon(CupertinoIcons.delete))
//                         ],
//                       ),
//
//                        Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//
//                           Icon(CupertinoIcons.add_circled_solid,size: 20),
//                           SizedBox(width: width * 0.03),
//                           Text(widget.product.quantity.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                           SizedBox(width:width * 0.03),
//                           Icon(CupertinoIcons.minus_circle_fill,size: 20)
//
//                         ],
//                       ),
//                        SizedBox(height: height * 0.01),
//                       RichText(
//                           text:  TextSpan(children: [
//                             TextSpan(
//                                 text: '7 days',
//                                 style: TextStyle(
//                                     fontSize:  height * 0.02,
//                                     color: Colors.deepOrange,
//                                     fontWeight: FontWeight.bold)),
//                             TextSpan(
//                                 text: ' return available',
//                                 style: TextStyle(
//                                   fontSize: height * 0.018,
//                                   color: Colors.deepOrange,))
//
//                           ])),
//                     ],
//                   ),
//                 )
//               ],),
//             );
//           }
//         ),
//         SizedBox(height: height * 0.02,)
//       ],
//     );;
//   }
// }
