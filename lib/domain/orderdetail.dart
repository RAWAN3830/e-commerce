import 'package:cloud_firestore/cloud_firestore.dart';

import 'model_class.dart';

class OrderDetails {
  final String orderId;
  final String? userEmail;
  final DateTime timeStamp;
  final int orderValue;
  final List<ProductModel> products;
  final String? paymentId;

  OrderDetails({
    required this.orderId,
    this.userEmail,
    required this.timeStamp,
    required this.orderValue,
    required this.products,
    this.paymentId,
  });

  OrderDetails copyWith({
    String? orderId,
    String? userEmail,
    int? orderValue,
    List<ProductModel>? products,
    String? paymentId,
    DateTime? timeStamp,
  }) =>
      OrderDetails(
        orderId: orderId ?? this.orderId,
        timeStamp: timeStamp ?? this.timeStamp,
        orderValue: orderValue ?? this.orderValue,
        products: products ?? this.products,
        paymentId: paymentId ?? this.paymentId,
        userEmail: userEmail ?? this.userEmail,
      );

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orderId: json["orderId"],
    userEmail: json["userEmail"],
    timeStamp: (json["timeStamp"] as Timestamp).toDate(),
    orderValue: json["orderValue"],
    products: List<ProductModel>.from(json["products"].map((e) => ProductModel.fromJson(e))),
    paymentId: json["paymentId"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "userEmail": userEmail,
    "timeStamp": Timestamp.fromDate(timeStamp),
    "orderValue": orderValue,
    "products": products.map((product) => product.toJson()).toList(),
    "paymentId": paymentId,
  };
}
