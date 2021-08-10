import 'dart:io';

import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:uuid/uuid.dart';

class BannerModel {
  final NameField name;
  String? image;
  String? imageId;
  final String? id;
  final String? date;
  bool isOpened;

  BannerModel(
      {required this.name,
        required this.id,
      this.isOpened = false,
      this.image,
      this.imageId,
      this.date,});

  factory BannerModel.fromJson(json) {
    return BannerModel(
        name: NameField.fromJson(json['name']),
        id: json['id'],
        imageId:json['image_id'],
        image: json['image'],
        isOpened: json['is_opened'],
        date: json['date']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    return data = {
      'name': name.toJson(),
      'image': image,
      'image_id':imageId,
      'is_opened': isOpened,
      'id': id,
      'date': DateTime.now().toIso8601String()
    };
  }
}
