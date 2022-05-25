List<Product> productsFromJson(data) => List<Product>.from(data.map((x) => Product.fromJson(x)));

class Product {
  int? id;
  late String title;
  late double price;
  String? description;
  String? category;
  late String image;
  Rating? rating;

  Product(
      {this.id,
      required this.title,
      required this.price,
      this.description,
      this.category,
      required this.image,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ??'';
    price = (json['price'] ?? 0.0).toDouble();
    description = json['description']??'';
    category = json['category'];
    image = json['image']??'';
    rating = json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final  data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] =rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  double? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = (json['rate'] ?? 0.0) .toDouble() ;
    count = (json['count'] ?? 0.0) .toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}