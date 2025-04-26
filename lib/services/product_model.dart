// class Product {
//   final String name;
//   final String category;
//   final double price;
//   final String image;
//   final String seller;
//   final String contact;

//   Product({
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.image,
//     required this.seller,
//     required this.contact,
//   });

//   // Convert Product to Map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'category': category,
//       'price': price,
//       'image': image,
//       'seller': seller,
//       'contact': contact,
//     };
//   }

//   // Convert Firestore Map back to Product Object
//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       name: map['name'] ?? '',
//       category: map['category'] ?? '',
//       price: (map['price'] is int) ? (map['price'] as int).toDouble() : map['price'],
//       image: map['image'] ?? '',
//       seller: map['seller'] ?? '',
//       contact: map['contact'] ?? '',
//     );
//   }
// }


class Product {
  final String id; // Firestore Document ID
  final String name;
  final String category;
  final double price;
  final String image;
  final String seller;
  final String contact;

  Product({
    this.id = '', // Default empty, will be assigned from Firestore
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.seller,
    required this.contact,
  });

  // Convert Product to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category.toLowerCase(), // Normalize category case
      'price': price,
      'image': image,
      'seller': seller,
      'contact': contact,
    };
  }

  // Convert Firestore Map back to Product Object
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] is int) ? (map['price'] as int).toDouble() : (map['price'] ?? 0.0),
      image: map['image'] ?? '',
      seller: map['seller'] ?? '',
      contact: map['contact'] ?? '',
    );
  }

  // ✅ Create a copy of the product with updated values
  Product copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    String? image,
    String? seller,
    String? contact,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      image: image ?? this.image,
      seller: seller ?? this.seller,
      contact: contact ?? this.contact,
    );
  }
}
