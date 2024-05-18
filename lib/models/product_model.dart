class Product {
  String image;
  String name;
  String description;
  double price;
  int quantity;
  String category;
  String? id;

  Product({
    required this.image,
    required this.price,
    required this.description,
    required this.name,
    required this.quantity,
    required this.category,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        image: json['image'],
        price: json['price'],
        description: json['description'],
        name: json['name'],
        quantity: json['quantity'],
        category: json['category'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'price': price,
      'description': description,
      'name': name,
      'quantity': quantity,
      'category': category,
      'id':id
    };
  }
}
