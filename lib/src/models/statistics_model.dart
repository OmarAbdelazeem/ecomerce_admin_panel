class StatisticsModel {
  late DateTime id;
  late int orders;
  late num canceledOrders;
  late num deliveredOrders;
  late num addedProducts;
  late num totalIncome;
  late num customers;

  StatisticsModel(this.id, this.orders, this.customers, this.deliveredOrders,
      this.canceledOrders, this.totalIncome, this.addedProducts);

  StatisticsModel.fromJson(json) {
    addedProducts = json['added_products'];
    orders = json['total_orders'];
    if (json['id'] != 'total') {
      var dateTime = DateTime.tryParse(json['id']);
      id = dateTime!;
    }

    canceledOrders = json['canceled_orders'];
    deliveredOrders = json['delivered_orders'];
    totalIncome = json['total_income'];
    customers = json['customers'];
  }
}
