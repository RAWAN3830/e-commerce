import 'package:e_commerce/infra/services/payment_service/order_functions.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/orderdetail.dart';

class OrderDetailProvider with ChangeNotifier{
 late List<OrderDetails> orderedProductList = [];

  Future<void> AllOrderData() async{
    orderedProductList = await OrderProductData().getOrderDetails();
    notifyListeners();
  }
}