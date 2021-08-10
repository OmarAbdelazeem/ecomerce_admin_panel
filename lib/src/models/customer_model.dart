import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
 late String  name;
 late String  phoneNumber;
 late String  id;
 late String  date;
 late num totalSpent;
 late List<Address?>? addresses = [];
 // late String email;

  CustomerModel({required this.name, required this.id, required this.phoneNumber, required this.addresses , required this.date});

  CustomerModel.fromJson(json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
    // email = json['email'];
    id = json['id'];
    date = json['date'];
    totalSpent = json['total_spent'];
    if (json['addresses'] != null) {
      addresses = <Address>[];
      print(json["addresses"]);
      addresses = (json['addresses'] as List)
          .map((e) => e == null ? null : Address.fromDocument(e))
          .toList();
    } else {
      addresses = [];
    }
  }

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['name'] = this.name;
   data['date'] = DateTime.now().toIso8601String();
   data['phone_number'] = this.phoneNumber;
   data['id'] = this.id;
   // data['email'] = this.email;
   if (this.addresses != null) {
     data['addresses'] = this.addresses!.map((v) => v!.toJson()).toList();
   }
   return data;
 }

}

class Address {
 late String name;
 late String pincode;
 late String address;
 late String city;
 late String state;
 late String phoneNumber;
 late bool isDefault;

  Address(
      { required this.name,
    required this.pincode,
    required this.address,
    required this.city,
    required this.state,
    required this.phoneNumber,
      this.isDefault = false});

  Address.fromDocument(json) {
    name = json['name'];
    pincode = json['pincode'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    phoneNumber = json['phone_number'];
    isDefault = json['is_default'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pincode'] = this.pincode;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone_number'] = this.phoneNumber;
    data['is_default'] = this.isDefault;
    return data;
  }

  String wholeAddress() {
    return "$address $city $state $pincode";
  }
}
