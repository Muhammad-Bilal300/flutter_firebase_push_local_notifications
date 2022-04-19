import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    // required this.id,
    // required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
    required this.image,
  });

  // late final int? id;
  // String? productId;
  String? productName;
  int? initialPrice;
  int? productPrice;
  int? quantity;
  String? unitTag;
  String? image;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        // id: json["id"],
        // productId: json["productId"],
        productName: json["productName"],
        initialPrice: json["initialPrice"],
        productPrice: json["productPrice"],
        quantity: json["quantity"],
        unitTag: json["unitTag"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "productId": productId,
        "productName": productName,
        "initialPrice": initialPrice,
        "productPrice": productPrice,
        "quantity": quantity,
        "unitTag": unitTag,
        "image": image,
      };
}
