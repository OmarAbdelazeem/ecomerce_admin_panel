class BasicOrderModel {
 late String orderId;
 late int ? orderNumber;
 late num total;
 late String orderedAt;
 late String orderStatus;

  BasicOrderModel({
    required this.orderId,
    required this.total,
    required this.orderedAt,
    required this.orderStatus,
    required this.orderNumber,
  });

  factory BasicOrderModel.fromJson(json) {
    return BasicOrderModel(
        orderId: json['order_id'] as String,
        total: json['total'] as num,
        orderStatus: json['order_status'] as String,
        orderedAt: json['ordered_at'] as String,
        orderNumber: json['order_number']);
  }
}
