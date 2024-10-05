import 'package:e_commerce/domain/model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../services/payment_service/payment_service.dart';

class PaymentProvider with ChangeNotifier{
  void getPayments({required int amount,required List<ProductModel> product,required BuildContext context}){
    PaymentService().getPaymentService(amount: amount, product:product,context: context);
    notifyListeners();
  }
}