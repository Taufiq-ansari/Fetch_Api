import 'dart:convert';

import 'package:fetch_api/itemwidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List getProducts = [];

  Future fetchData() async {
    final url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));
    var decodedData = jsonDecode(response.body);
    getProducts = decodedData["products"];
    print(getProducts);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fetch app"),
      ),
      body: ListView.builder(
          itemCount: getProducts.length,
          itemBuilder: (context, index) {
            final product = getProducts[index];
            return ItemWidgets(
              products: product,
            );
          }),
    );
  }
}
