class Product_summary{

  final String id;
  final String name;

  Product_summary({required this.id, required this.name});

  /// factory meathod to create a interface for an object
  /// factory constructor ----> used to return a instance of the same class
  factory Product_summary.from_json(Map<String,dynamic> json){
    return Product_summary(
        id : json['_id'],
        name : json['name']
    );
  }

}