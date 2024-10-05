import 'package:e_commerce/core/constant/extension.dart';
import 'package:e_commerce/domain/orderdetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/model_class.dart';
import '../../../presentation/tabs/order_conformation_screen/order_confirmation_screen.dart';
import 'order_functions.dart';

class PaymentService {
  final _razorpay = Razorpay();
  final uuid = const Uuid();

  void _handlePaymentSuccess(PaymentSuccessResponse response,
      {required OrderDetails orderDetails,
      required BuildContext context}) async {
    // Do something when payment success
    //1 . add order details in firebase
    //2 . clear Basket
    await OrderProductData().placeOrder(
        orderDetails: orderDetails.copyWith(paymentId: response.paymentId));
    await OrderProductData().clearBasket();
    if (!context.mounted) return;
    context.pushAndRemoveUntil(context,
        target: OrderConfirmationScreen(
          orderDetails: orderDetails,
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void getPaymentService(
      {required int amount, required List<ProductModel> product,required BuildContext context}) {
    final authUser = FirebaseAuth.instance.currentUser;

    final orderDetails = OrderDetails(
        orderId: uuid.v1() ,
        timeStamp: DateTime.now(),
        orderValue: amount,
        products: product,
        userEmail: authUser?.email);

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        (response) => _handlePaymentSuccess(response,
            orderDetails: orderDetails, context:context));

    var options = {
      'user_id': authUser?.uid ?? '',
      'customer': {
        "email": authUser?.email ?? '',
      },
      "notify": {
        "email": true,
      },
      'email': 'veddhanani75@gmail.com',
      'contact': '812312312',
      'key': 'rzp_test_8q6i0nQ3mc239Y',
      'amount': amount * 100,
      'name': 'ShopSizzle',
      'description': 'Fuck RazorPay !!!',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    _razorpay.open(options);
  }
}
