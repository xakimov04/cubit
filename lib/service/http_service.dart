import 'dart:convert';
import 'package:cubit/models/product_models.dart';
import 'package:http/http.dart' as http;

class HttpService {
  List<ProductModels> data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    if (response.statusCode == 200) {
      List products = json.decode(response.body);
      data = products.map<ProductModels>((product) => ProductModels.fromJson(product)).toList();
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
