import 'package:e_commerce/presentation/tabs/cart_screen/cart_screen.dart';
import 'package:e_commerce/presentation/tabs/home_screen/first.dart';
import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/api_provider.dart';
import 'carosole.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    super.key,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context,listen: false).ProviderProductData();
  }
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final CategoryImage = [
      'https://www.cnet.com/a/img/resize/c1ab83724b6c9ff0fc41efb24f6e382fb12048ec/hub/2023/01/26/c72313e2-806d-4ce3-8783-5c288d8fdf6f/canon-r6-ii-review-cnet-best-camera.jpg?auto=webp&fit=crop&height=576&width=768',
      'https://i.pinimg.com/originals/ff/d0/5b/ffd05b7faed8b4dd1abe83bda8f6dd4d.jpg',
      'https://e7.pngegg.com/pngimages/335/378/png-clipart-men-s-fashion-male-fashion-model-down.png',
      'https://www.incredibleindia.net.in/wp-content/uploads/2023/02/Traditional-Saree-Dress-for-Women.jpg',
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: height * 0.10,
          flexibleSpace:
              Consumer<ApiProvider>(builder: (context, value, child) {
            return value.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: value.categoryList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(id: value.categoryList[index].id.toString()),));
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => first(id: value.categoryList[index].id.toString()),));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height * .20,
                                      width: width * .25,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  CategoryImage[index]),
                                              fit: BoxFit.fill,
                                              opacity: .6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                            value.categoryList[index].name
                                                .toString(),
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  );
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const CarasoleSlider(),
              SizedBox(
                height: height * 0.02,
              ),
              // Container(
              //   height: height * 0.03,
              //   width: double.infinity,
              //   color: Colors.red,
              //   child: Center(
              //     child: Marquee(
              //       text: 'SALE UPTO 50% OFF',
              //       style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //           color: Colors.white),
              //       scrollAxis: Axis.horizontal,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       blankSpace: 20.0,
              //       startPadding: 10.0,
              //       accelerationCurve: Curves.ease,
              //       decelerationCurve: Curves.ease,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: SizedBox(
              //       height: height * 0.17,
              //       width: double.infinity,
              //       child: Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.blue),
              //         child: Image.network(
              //           'https://assets.ajio.com/cms/AJIO/WEB/D-1.0-UHP-25042024-MainBannerDailyChanging-Z1-P1-100Hrsspecialrev.gif',
              //           // 'https://assets.ajio.com/cms/AJIO/WEB/D-1.0-UHP-05012024-MainBannerDailyChanging-Z1-P1-AJIOMANIA-5090.gif',
              //           fit: BoxFit.fill,
              //         ),
              //       )),
              // ),
              Consumer<ApiProvider>(builder: (context, product, child) {
                return product.isLoading
                    ? Center(child: const CircularProgressIndicator())
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                        itemCount: product.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            mainAxisExtent: height * .37,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return productModelCard(
                              product: product.productList[index]);
                        });
              }),
            ],
          ),
        ));
  }
}
