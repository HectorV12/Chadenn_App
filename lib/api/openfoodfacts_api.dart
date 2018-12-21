import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Product> fetchProduct(String productCode) async {
  final response = await http.get(
      'https://ssl-api.openfoodfacts.org/api/v0/product/$productCode.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Product.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Product {
  final String code;
  final String productName;
  final String brand;
  final String imageUrl;
  final String origins;
  final String manufacturingPlaces;
  final String nutritionGrade;
  final Map nutriments;
  final String ingredients;

  Product({
    this.code,
    this.productName,
    this.brand,
    this.imageUrl,
    this.origins,
    this.manufacturingPlaces,
    this.nutritionGrade,
    this.nutriments,
    this.ingredients,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['code'],
      productName: json['product']['product_name'],
      brand: json['product']['brands'],
      imageUrl: json['product']['image_url'],
      origins: json['product']['origins'],
      manufacturingPlaces: json['product']['manufacturing_places'],
      nutritionGrade: json['product']['nutrition_grades'],
      nutriments: json['product']['nutriments'],
      ingredients: json['product']['ingredients_text'],
    );
  }
}
