import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Product> fetchProduct(String productCode) async {
  final response = await http
      .get('https://world.openfoodfacts.org/api/v0/product/$productCode.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Product.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Product {
  final String statusVerbose;
  final String code;
  final String brand;
  final String productName;
  final String imageUrl;

  Product(
      {this.statusVerbose,
      this.code,
      this.brand,
      this.productName,
      this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        statusVerbose: json['status_verbose'],
        code: json['code'],
        brand: json['product']['brands'],
        productName: json['product']['product_name'],
        imageUrl: json['product']['image_url']);
  }
}
