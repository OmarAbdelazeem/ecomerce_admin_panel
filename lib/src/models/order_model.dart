import 'customer_model.dart';

class OrderModel {
 late String orderId;
 late int orderNumber;
 late num total;

  List<OrderItem?> ? orderItems;
 late String orderedAt;
 late String orderStatus;

  // String currency;
  // String paymentId;
  // String signature;
 late Address orderAddress;

  OrderModel(
      {required this.orderId,
     required this.total,
     required this.orderItems,
     required this.orderedAt,
     required this.orderStatus,
     required this.orderNumber,
      // this.currency,
      // this.paymentId,
      // this.signature,
        required this.orderAddress});

  factory OrderModel.fromJson(json) {
    return OrderModel(
        orderId: json['order_id'] as String,
        total: json['total'] as num,
        orderStatus: json['order_status'] as String,
        orderedAt: json['ordered_at'] as String,
        orderNumber: json['order_number'],
        // currency: json['currency'] as String,
        // paymentId: json['payment_id'] as String,
        // signature: json['signature'] as String,
        orderAddress: Address.fromDocument(json['order_address']),
        orderItems: (json['order_items'] as List)
            .map((e) => e == null ? null : OrderItem.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'order_id': orderId,
        'total': total,
        'ordered_at': DateTime.now().toIso8601String(),
        "order_status": "Ordered",
        // "currency": orderItems[0].currency,
        // "payment_id": paymentId,
        // "signature": signature,
        "order_address": orderAddress.toJson(),
        'order_items': List<dynamic>.from(orderItems!.map((x) => x!.toJson())),
      };

  @override
  String toString() {
    return 'OrderModel{orderId: $orderId, price: $total, orderItems: $orderItems}';
  }
}

class OrderItem {
 late String productId;
 late String image;
 late String name;

  // String unit;
  // String currency;
 late num price;
 late num noOfItems;

  OrderItem(
      {required this.productId,
        required this.image,
        required this.name,
      // this.unit,
      // this.currency,
     required this.price,
     required this.noOfItems});

  factory OrderItem.fromJson(json) {
    return OrderItem(
      productId: json['product_id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      // unit: json['unit'] as String,
      // currency: json['currency'] as String,
      price: json['price'] as num,
      noOfItems: json['no_of_items'] as num,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'product_id': productId,
        'image': image,
        'name': name,
        // 'unit': unit,
        // 'currency': currency,
        'price': price,
        'no_of_items': noOfItems,
      };

  @override
  String toString() {
    return 'OrderItem{productId: $productId, image: $image, name: $name, currency: EGP, price: $price, noOfItems: $noOfItems}';
  }
}
