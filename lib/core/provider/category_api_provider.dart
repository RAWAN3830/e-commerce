import 'package:flutter/cupertino.dart';

import '../../domain/model_class.dart';
import '../services/api_service/product_by_category_api.dart';

class CategoryProvider with ChangeNotifier{


  List<ProductModel> productByCategory = [];
  // --------------- PROVIDER OF API WHO CALLING PRODUCT BY CATEGORY ------------------------------
  Future<void> providerProductByCategory({required String id}) async {
    // setLoading(true);
    productByCategory = await ProductByCategoryApi.productByCategory(id: id);
    print(productByCategory);
    // setLoading(false);
    notifyListeners();
  }
}