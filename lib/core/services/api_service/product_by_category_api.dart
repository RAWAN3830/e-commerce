import 'dart:convert';

import 'package:e_commerce/domain/model_class.dart';
import 'package:http/http.dart' as http;

class ProductByCategoryApi
{
   static Future<List<ProductModel>> productByCategory({required String id}) async{
     List<ProductModel> ProductByCategoryList= [];
     http.Response res = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$id'));
     var d = jsonDecode(res.body);
     for(var e in d)
       {
         ProductByCategoryList.add(ProductModel.fromJson(e));

       }
     return ProductByCategoryList;


   }

}
