// her i am commenting owner id because the owner_id
// is present in the token itself no need to pass it agian

class Product {
   final String name;
   final String description;
   final int quantity;
   final int price;
   final List<String> images;
   final String category;
   final String? id;
   final String? owner_id;

   Product( {
      required this.name,
      required this.description,
      required this.quantity,
      required this.price,
      required this.images,
      required this.category,
      this.owner_id,
      this.id,
   });

   factory Product.fromJson(Map<String, dynamic> json) {
      return Product(
         id: json['_id'] ?? '',
         name: json['name'] ?? '',
         description: json['description'] ?? '',
         quantity: json['quantity'] ?? '0', // Convert string to int
         price: json['price'] ?? '0', // Convert string to int
         images: (json['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
         category: json['category'] ?? '',
         owner_id: json['owner_id'] ?? '',
      );
   }



   Map<String, dynamic> toJson() {
      return {
         // 'id': id,
         'name': name,
         'description': description,
         'images': images,
         'quantity': quantity,
         'price': price,
         'category': category,
         'owner_id': owner_id,
      };
   }
}
