// Consumer<ApiProvider>(builder: (context, value, child) {
// return  SizedBox(
// height: height * 0.1,
// width: double.infinity,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: value.categoryList.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: () {
// setState(() {
// value.categoryList[index].id.toString();
// });
// // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(id: value.categoryList[index].id.toString()),));
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryList()));
// },
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// height: height * .20,
// width: width * .4,
// decoration: BoxDecoration(
// color: Colors.black,
// image: DecorationImage(
// image: NetworkImage(
// CategoryImage[index]),
// fit: BoxFit.cover,
// opacity: .5),
// borderRadius:
// BorderRadius.circular(20)),
// child: Center(
// child: Text(
// value.categoryList[index].name
//     .toString(),
// maxLines: 2,
// style: const TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontWeight: FontWeight.bold)),
// ),
// ),
// ));
// }),
// ),
// ],
// ),
// );
// }),


//========================================================= this is product card in vertical scroll
// Consumer<CategoryProvider>(builder: (context, value, child) {
// return  SizedBox(
// height: height * 0.4,
// width: double.infinity,
// child: GridView.builder(
// // physics: const NeverScrollableScrollPhysics(),
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemCount: value.productByCategory.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisSpacing: 2,
// mainAxisExtent: height * .37,
// crossAxisCount: 1,
// mainAxisSpacing: 5),
// itemBuilder: (context, index) {
// return productModelCard(
// product: value.productByCategory[index],
// );
// },
// ),
// );
// }),
//
