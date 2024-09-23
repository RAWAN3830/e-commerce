import 'package:e_commerce/domain/categorie_model.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/model_class.dart';
import '../services/api_service/categorie_api.dart';
import '../services/api_service/product_api.dart';

class ApiProvider with ChangeNotifier {

  bool isLoading = false;
  bool isTheme = false;

  void setLoading(bool val)
  {
    isLoading = val;
  }
  List<ProductModel> productList = [];
  List<CategorieModel> categoryList = [];

//--------------- PROVIDER OF API WHO CALLING PRODUCT  ------------------------------

  Future<dynamic> ProviderProductData() async {
    setLoading(true);
    productList = await ProductApiCall().loadApiData();
    print(productList);
    setLoading(false);
    notifyListeners();
  }

//--------------- PROVIDER OF API WHO PROVIDE CATEGORY ------------------------------

  Future<void> providerCategory() async {
    setLoading(true);
    categoryList = await CategorieApi.fetchCategories();
    print(categoryList);
    setLoading(false);
    notifyListeners();
  }

  set setTheme(value) {
    isTheme = value;
    notifyListeners();
  }

  get getTheme {
    return isTheme;
  }


}
