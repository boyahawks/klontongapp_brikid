import 'dart:convert';

class ProductModel {
  String id;
  int idProduct;
  int categoryId;
  String sku;
  String name;
  String description;
  String image;
  double harga;

  ProductModel({
    required this.id,
    required this.idProduct,
    required this.categoryId,
    required this.sku,
    required this.name,
    required this.description,
    required this.image,
    required this.harga,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        idProduct: json["id"],
        categoryId: json["categoryId"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        harga: json["harga"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "id": idProduct,
        "categoryId": categoryId,
        "sku": sku,
        "name": name,
        "description": description,
        "image": image,
        "harga": harga,
      };

  String toJson() => json.encode(toMap());
}

class CategoryModel {
  int id;
  String categoryName;

  CategoryModel({
    required this.id,
    required this.categoryName,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_name": categoryName,
      };

  String toJson() => json.encode(toMap());
}
