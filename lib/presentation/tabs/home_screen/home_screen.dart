import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../infra/provider/api_provider.dart';
import 'carosole.dart';

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

        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const CarasoleSlider(),
              SizedBox(
                height: height * 0.02,
              ),

              // Container(
              //   height: height * 0.23,
              //   width: double.infinity,
              //   decoration: const BoxDecoration(
              //       // borderRadius: BorderRadius.circular(10),
              //       color: Colors.blue,image: DecorationImage(image: NetworkImage('https://assets.ajio.com/cms/AJIO/MOBILE/M-1.0-UHP-14092024-100ReasontoShop-Gif-Revised.gif'),fit: BoxFit.contain)),
              //
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
                            mainAxisExtent: height * .365,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return productModelCard(
                              product: product.productList[index]);
                        });
              }),


              // SizedBox(
              //   height: height * 0.15,
              //   width: double.infinity,
              //   child: Image.network(
              //     'https://assets.ajio.com/cms/AJIO/WEB/D-1.0-UHP-25042024-MainBannerDailyChanging-Z1-P1-100Hrsspecialrev.gif',
              //     fit: BoxFit.fill,
              //   ),
              // ),
            ],
          ),
        ));
  }
}
