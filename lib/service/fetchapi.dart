import 'dart:convert';

import 'package:fetch_api/model/get_api.dart';
import 'package:http/http.dart' as http;

class ProductsServices {


  Future fetchData() async {
    final url = "https://dummyjson.com/products";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        List productapi = decodedData["products"];
        List<ProductsItems> productsList = List.from(productapi)
            .map<ProductsItems>((p) => ProductsItems.fromJson(p))
            .toList();
        return productsList;
      } else {
        throw ("error message ${response.statusCode}");
      }
    } catch (e) {
      throw ("Exception $e");
    }
  }


}

// void main() async {
//   ProductsServices apiservice = ProductsServices();
//   List<ProductsItems> result = await apiservice.fetchData();

//   for (var element in result) {
//     print(element.title);
//   }
// }
