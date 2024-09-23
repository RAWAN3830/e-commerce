import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/provider/category_api_provider.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    super.key,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context,listen: false).ProviderProductData();
  }
  int current = 0;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      ),
        resizeToAvoidBottomInset: false,
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
                    ? const Center(child: CircularProgressIndicator())
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
