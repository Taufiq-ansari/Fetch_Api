import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets({super.key, required this.products});

  final Map products;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(products["title"]));
  }
}
