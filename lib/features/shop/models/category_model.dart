import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;


  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
});

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '',name: '', isFeatured: false, image: '');


  /// convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name' : name,
      'Image' : image,
      'ParentId' : parentId,
      'IsFeatured' : isFeatured,

    };
  }



  /// Map json oriented document form firebase to usermodel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }













}