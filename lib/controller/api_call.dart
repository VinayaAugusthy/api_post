import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task2/model/product_model.dart';

Future<List<Product>> fetchProducts(int page, int perPage) async {
  const baseUrl = 'http://shop.ishwarpharma.com/api';
  const endpoint = '/get-products';

  final Map<String, dynamic> requestBody = {
    "search_all": "",
    "page": page.toString(),
    "per_page": perPage.toString(),
  };
  // FormData.fromMap({"categoryName": category, "goal": goal});
  try {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
       List<Product> products = [];

      ProductModel data = ProductModel.fromJson(jsonResponse);
      products = data.data!;
      return products;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Network error: $e');
    return [];
  }
}
