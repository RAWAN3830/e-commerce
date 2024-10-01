import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../services/payment_service/payment_service.dart';

class PaymentProvider with ChangeNotifier{
  void getPayments({required int amount}){
    PaymentService().getPaymentService(amount: amount);
    notifyListeners();
  }
}