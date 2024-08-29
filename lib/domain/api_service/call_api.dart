import 'dart:convert';

import 'package:dio/dio.dart';
import '../model_class.dart';
import 'package:http/http.dart' as http;

// class ApiService{
//   Future<ProductModel> fetchData() async{
//     final dio = Dio();
//     final result = await dio.get('https://fakestoreapi.com/products');
//      return ProductModel.fromJson(result.data['data']);
//   }
// }

class apiRepo {
  ProductModel? pm;

  Future<List<ProductModel>> LoadApiData() async {

    http.Response res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    print(res.body);

    var d = jsonDecode(res.body);
     for (var e in d) {
       productData.add(ProductModel.fromJson(e));

    // weatherList.add(wm!);
     }
return productData;
  }
}
