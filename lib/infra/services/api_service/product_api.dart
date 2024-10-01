
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../domain/model_class.dart';

class ProductApiCall {
   Future<List<ProductModel>> loadApiData() async {
    List<ProductModel> productData =[];
    http.Response res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var d = jsonDecode(res.body);
    for (var e in d) {
      productData.add(ProductModel.fromJson(e));
    }
    return productData;
  }
}
