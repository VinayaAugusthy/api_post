
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      price: json['price'] as double,
    );
  }
}
class ProductModel {
 bool? success;
 List<Product>? data;
 int? nextpage;
 String? message;

 ProductModel({this.success, this.data, this.nextpage, this.message});

 ProductModel.fromJson(Map<String, dynamic> json) {
  success = json['success'];
  if (json['data'] != null) {
   data = <Product>[];
   json['data'].forEach((v) { data!.add(new Product.fromJson(v)); });
  }
  nextpage = json['nextpage'];
  message = json['message'];
 }

}
