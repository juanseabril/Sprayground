import 'dart:convert';

ProductByName productByNameFromJson(String str) =>
    ProductByName.fromJson(json.decode(str));

String productByNameToJson(ProductByName data) => json.encode(data.toJson());

class ProductByName {
  ProductByName({
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

  factory ProductByName.fromJson(Map<String, dynamic> json) => ProductByName(
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
