// import 'package:e_commerce/core/provider/api_provider.dart';
// import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
// import 'package:e_commerce/presentation/tabs/home_screen/tabbar_screen/tabbat_title.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/provider/category_api_provider.dart';
//
// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({super.key});
//
//   @override
//   State<CategoriesScreen> createState() => _CategoriesScreenState();
// }
//
// class _CategoriesScreenState extends State<CategoriesScreen>
//     with TickerProviderStateMixin {
//   late TabController tabController;
//   final List<String> categoryImage = [
//     'https://www.cnet.com/a/img/resize/c1ab83724b6c9ff0fc41efb24f6e382fb12048ec/hub/2023/01/26/c72313e2-806d-4ce3-8783-5c288d8fdf6f/canon-r6-ii-review-cnet-best-camera.jpg?auto=webp&fit=crop&height=576&width=768',
//     'https://i.pinimg.com/originals/ff/d0/5b/ffd05b7faed8b4dd1abe83bda8f6dd4d.jpg',
//     'https://e7.pngegg.com/pngimages/335/378/png-clipart-men-s-fashion-male-fashion-model-down.png',
//     'https://www.incredibleindia.net.in/wp-content/uploads/2023/02/Traditional-Saree-Dress-for-Women.jpg',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ApiProvider>(context, listen: false).providerCategory();
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.1,
//               child: Consumer<ApiProvider>(
//                 builder: (context, value, child) {
//                   tabController = TabController(
//                     length: value.categoryList.length,
//                     vsync: this,
//                   );
//                   return Row(
//                     children: [
//                       TabBar(
//                         onTap: (index) =>
//                             Provider.of<CategoryProvider>(context, listen: false)
//                                 .providerProductByCategory(
//                           id: value.categoryList[index].id.toString(),
//                         ),
//                         tabs: value.categoryList
//                             .map(
//                               (category) => Tab(
//                                 child: TabbarTitle(imagePath: '', title:category.name.toString(),)
//                               ),
//                             )
//                             .toList(),
//                         controller: tabController,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Consumer<CategoryProvider>(builder: (context, value, child) {
//               return  GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemCount: value.productByCategory.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisSpacing: 2,
//                           mainAxisExtent: height * .37,
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 5),
//                       itemBuilder: (context, index) {
//                         return productModelCard(
//                           product: value.productByCategory[index],
//                         );
//                       },
//                     );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:e_commerce/presentation/tabs/home_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../../../infra/provider/api_provider.dart';
import '../../../infra/provider/category_api_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int? selectedCategoryIndex; // To track the selected category index
  final List<String> categoryImage = [
    'https://img.freepik.com/premium-photo/camera-with-lens-turned-off-camera-is-made-by-company_1064589-31860.jpg',
    'https://simonewalsh.com/cdn/shop/files/banner-gold-jewellery-2022.jpg?v=1670496877&width=1700',
    'https://game-clothing.co.uk/cdn/shop/collections/Pro-ll-Carousel-Lifestlye-3.jpg?v=1719313212&width=1080',
    'https://www.incredibleindia.net.in/wp-content/uploads/2023/02/Traditional-Saree-Dress-for-Women.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).providerCategory();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Categories'),
      // ),
      body: SingleChildScrollView(
        child: Consumer<ApiProvider>(
          builder: (context, apiProvider, child) {
            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: height * 0.14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: Image.network('https://assets.myntassets.com/f_auto,q_auto:eco,dpr_1.3,w_600,c_limit,fl_progressive/assets/images/2024/9/16/fc21ea91-27c4-4cdb-b1b1-253fb1fe662a1726476766235-Omg-header_BFF_Phase02.gif',fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.03,
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(
                    child: Marquee(
                      text: 'SALE UPTO 50% OFF',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      startPadding: 10.0,
                      accelerationCurve: Curves.ease,
                      decelerationCurve: Curves.ease,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: apiProvider.categoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = selectedCategoryIndex == index ? null : index;
                        });
                        Provider.of<CategoryProvider>(context, listen: false)
                            .providerProductByCategory(
                          id: apiProvider.categoryList[index].id.toString(),
                        );
                      },
                      child:
                      Column(
                        children: [
                       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * .20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(
                                    categoryImage[index]),
                                fit: BoxFit.cover,
                                opacity: .5),
                            borderRadius:
                            BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                              apiProvider.categoryList[index].name
                                  .toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,

                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),

                          if (selectedCategoryIndex == index)
                            Consumer<CategoryProvider>(builder: (context, value, child) {
                              return  SizedBox(
                                height: height * 0.4,
                                width: double.infinity,
                                child: GridView.builder(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: value.productByCategory.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 2,
                                      mainAxisExtent: height * .37,
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 5),
                                  itemBuilder: (context, index) {
                                    return productModelCard(
                                      product: value.productByCategory[index],
                                    );
                                  },
                                ),
                              );
                            }),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
