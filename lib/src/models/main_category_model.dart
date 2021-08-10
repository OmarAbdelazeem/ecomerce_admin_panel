import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'name_field_model.dart';

class MainCategoryModel extends Equatable{
  String id;
  NameField name;
  List mainCategoriesIds;

  MainCategoryModel({required this.mainCategoriesIds, required this.id, required this.name});

  factory MainCategoryModel.fromJson(DocumentSnapshot documentSnapshot) {
    return MainCategoryModel(
        id:  documentSnapshot['id'],
        name: NameField.fromJson(documentSnapshot['name']),
        mainCategoriesIds: documentSnapshot['sub_categories_ids']
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name':name.toJson(),
      'sub_categories_ids': []
    };
  }

  @override
  // TODO: implement props
  List<Object> get props => [id ,name,mainCategoriesIds];
}

