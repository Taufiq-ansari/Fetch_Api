import 'package:fetch_api/pages/itemwidgets.dart';
import 'package:fetch_api/provider.dart/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // var getProducts = [];

  // Future fetchData() async {
  //   final url = "https://dummyjson.com/products";
  //   final response = await http.get(Uri.parse(url));
  //   var decodedData = jsonDecode(response.body);
  //   getProducts = decodedData["products"];
  //   print(getProducts);
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    print("building build");
    return Scaffold(
      appBar: AppBar(
        title: Text("fetch app"),
      ),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.product.length,
              itemBuilder: (context, index) {
                final productList = provider.product[index];
                return ItemWidgets(
                  products: productList,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.loadingData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}