import 'package:fetch_api/model/get_api.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets({super.key, required this.products});

  final ProductsItems products;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          products.title,
        ),
        subtitle: Text(
          products.description,
        ),
        leading: Image.network(
          products.images.isNotEmpty ? products.images[0] : "no image",
        ),
        trailing: Text("\$${products.price}"),
      ),
    );
  }
}
