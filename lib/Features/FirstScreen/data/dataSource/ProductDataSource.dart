import 'package:task1/Features/FirstScreen/data/dataModels/ProductDataModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductDataSource {
  static List<ProductDataModel> data = [];
  static bool isLoading = false;
  static bool isError = false;
  static Future<void> getProductsData() async {
    try {
      isLoading = true;
      data.clear();
      final uri = Uri.parse("https://fakestoreapi.com/products");

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> ListOfObjects = jsonDecode(response.body);
        for (Map<String, dynamic> object in ListOfObjects) {
          ProductDataModel product = ProductDataModel(
            image: object['image'],
            title: object['title'],
            description: object['description'],
            price: object['price'].toDouble(),
          );
          data.add(product);
        }
        isLoading = false;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      isError = true;
      isLoading = false;
      print(e);
      print("failed to fetch data");
    }
  }
}
