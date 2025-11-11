import 'package:fetch_api/pages/itemwidgets.dart';
import 'package:fetch_api/provider.dart/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _searchController = TextEditingController();
  // var getProducts = []

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
        title: TextField(
          controller: _searchController,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Provider.of<ProductsProvider>(context, listen: false)
              provider.onsearch(_searchController.text);
            },
            icon: Icon(Icons.search),
          ),
        ],
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
