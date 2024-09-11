import 'package:dio/dio.dart';
import 'package:e_commerce/domain/categorie_model.dart';

class CategorieApi {
  static final _dio = Dio();

  static Future<List<CategorieModel>> fetchCategories() async {
    List<CategorieModel> categories = [];
    final response = await _dio.get("https://fakestoreapi.com/products/categories");
    final categoryList = response.data;

    for (int i = 0; i < categoryList.length; i++) {
      categories.add(
        CategorieModel(
          id: categoryList[i],
          name: categoryList[i].toUpperCase(),
        ),
      );
    }

    return categories;
  }
}
