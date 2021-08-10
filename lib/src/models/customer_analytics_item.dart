import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';

class CustomerAnalyticsModel {
late String image;
late NameField name;
late num numberOfItems;
late num numberOfTimes;
late num totalSpent;
late String productId;

  CustomerAnalyticsModel(this.totalSpent, this.productId,
      this.numberOfTimes, this.numberOfItems, this.image, this.name);

  CustomerAnalyticsModel.fromJson(json) {
    image = json['image'];
    name = NameField.fromJson(json['name']);
    numberOfItems = json['no_of_items'];
    numberOfTimes = json['number_of_times'];
    productId = json['product_id'];
    totalSpent = json['total_spent'];
  }
}
