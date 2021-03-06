import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productColor,
    required this.productCategory,
    required this.productImgPath,
    required this.productStock,
  });

  int productId;
  String productName;
  double productPrice;
  String productDescription;
  String productColor;
  String productCategory;
  String productImgPath;
  double productStock;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["ProductId"],
        productName: json["ProductName"],
        productPrice: json["ProductPrice"],
        productDescription: json["ProductDescription"],
        productColor: json["ProductColor"],
        productCategory: json["ProductCategory"],
        productImgPath: json["ProductImgPath"],
        productStock: json["ProductStock"],
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "ProductPrice": productPrice,
        "ProductDescription": productDescription,
        "ProductColor": productColor,
        "ProductCategory": productCategory,
        "ProductImgPath": productImgPath,
        "ProductStock": productStock,
      };
}
