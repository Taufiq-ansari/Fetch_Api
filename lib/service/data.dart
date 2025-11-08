import 'package:http/http.dart' as http;

class ApiServices {
  Future fetchData() async {
    final url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));

    print(response.body);
  }
}
