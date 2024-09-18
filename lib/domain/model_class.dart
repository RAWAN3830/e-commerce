class ProductModel {
  final String? id;
  final String? title;
  final String? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  int? quantity; // quantity is not final because it can changeble;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"].toString(),
      title: json["title"],
      price: json["price"].toString(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: Rating.fromJson(json["rating"]),
      quantity: 1);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
        "quantity": quantity,
      };
}

class Rating {
  final double? rate;
  final String? count;

  Rating({required this.count, required this.rate});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(count: json["count"].toString(), rate: json["rate"]?.toDouble());

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
