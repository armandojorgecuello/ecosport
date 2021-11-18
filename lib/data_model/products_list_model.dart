import 'dart:convert';

ProductListModel productListFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
    ProductListModel({
        this.success,
        this.products,
    });

    bool success;
    List<Product> products;

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        success: json["success"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.addedBy,
        this.userId,
        this.categoryId,
        this.brandId,
        this.photos,
    });

    int id;
    String name;
    String addedBy;
    int userId;
    int categoryId;
    int brandId;
    dynamic photos;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        addedBy: json["added_by"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        photos: json["photos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "added_by": addedBy,
        "user_id": userId,
        "category_id": categoryId,
        "brand_id": brandId,
        "photos": photos,
    };
}
