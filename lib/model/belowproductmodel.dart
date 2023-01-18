import 'dart:convert';

List<Productbelowmodel?>? productbelowmodelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<Productbelowmodel?>.from(
            json.decode(str)!.map((x) => Productbelowmodel.fromJson(x)));

String productbelowmodelToJson(List<Productbelowmodel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Productbelowmodel {
  Productbelowmodel({
    required this.categoryId,
    required this.stock,
    required this.categoryName,
    required this.products,
  });

  final int? categoryId;
  final bool? stock;
  final String? categoryName;
  final List<Product?>? products;

  factory Productbelowmodel.fromJson(Map<String, dynamic> json) =>
      Productbelowmodel(
        categoryId: json["category_id"],
        stock: json["stock"],
        categoryName: json["category_name"],
        products: json["products"] == null
            ? []
            : List<Product?>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "stock": stock,
        "category_name": categoryName,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.stock,
    required this.isOffer,
    required this.offerType,
    required this.offer,
    required this.price,
    required this.img,
    required this.type,
    required this.description,
    required this.tags,
    required this.customizable,
  });

  final int? id;
  final String? name;
  final bool? stock;
  final bool? isOffer;
  final String? offerType;
  final String? offer;
  final int? price;
  final String? img;
  final Type? type;
  final String? description;
  final List<dynamic>? tags;
  final bool? customizable;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        stock: json["stock"],
        isOffer: json["is_offer"],
        offerType: json["offer_type"],
        offer: json["offer"],
        price: json["price"],
        img: json["img"],
        type: json["type"],
        description: json["description"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        customizable: json["customizable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stock": stock,
        "is_offer": isOffer,
        "offer_type": offerType,
        "offer": offer,
        "price": price,
        "img": img,
        "type": type,
        "description": description,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "customizable": customizable,
      };
}

class Offer {
  Offer({
    required this.offerPc,
    required this.description,
    required this.offerUpto,
    required this.offerPrice,
  });

  final String? offerPc;
  final String? description;
  final String? offerUpto;
  final double? offerPrice;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerPc: json["offerPc"],
        description: json["description"],
        offerUpto: json["offerUpto"],
        offerPrice: json["offerPrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "offerPc": offerPc,
        "description": description,
        "offerUpto": offerUpto,
        "offerPrice": offerPrice,
      };
}
