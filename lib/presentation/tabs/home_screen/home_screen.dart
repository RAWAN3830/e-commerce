import 'package:e_commerce/domain/api_service/call_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model_class.dart';
import '../../../domain/provider/provider.dart';
import '../description_screen/discription_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> pm = [];

  @override
  void initState() {
    super.initState();
    apiRepo().LoadApiData().then((value) {
      setState(() {
        pm = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    // final provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('hello'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: pm?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisExtent: _height * .35,
                crossAxisCount: 2,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DiscriptionScreen(
                                id: pm?[index].id,
                                title: pm?[index].title,
                                price: pm?[index].price,
                                description: pm?[index].description,
                                category: pm?[index].category,
                                image: pm?[index].image,
                              )));
                    },
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(pm?[index].image ?? '')),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: _height * .18,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2.0,
                                  blurRadius: 3.0)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            CupertinoIcons.heart,
                            size: 28,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      pm?[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '\$ ${pm?[index].price}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'rating ${pm?[index].rating?.rate}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  // Text('@ ${pm!.price!.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
          ),
        ));
  }
}
