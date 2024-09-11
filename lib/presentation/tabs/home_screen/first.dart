// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class first extends StatelessWidget {
//   const first({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//    

// }

import 'package:e_commerce/domain/model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/api_provider.dart';

class first extends StatefulWidget {
  final String id;
  
  const first({super.key,required this.id});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
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
      appBar:AppBar(title: const Text('hello 1'),),
      body: Column(children: [
        SizedBox(height: height* 0.02,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ApiProvider>(
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
        ),
      ],),
    );
  }
}
