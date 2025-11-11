import 'package:fetch_api/model/get_api.dart';
import 'package:fetch_api/service/fetchapi.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductsServices _service = ProductsServices();
// constructor
  ProductsProvider() {
    loadingData();
  }
  List<ProductsItems> _product = [];
  bool _isLoading = false;

// get
  List<ProductsItems> get product => _product;

  List<ProductsItems> originalProducts = [];
  bool get isLoading => _isLoading;

// method

  loadingData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _product = await _service.fetchData();
      originalProducts = List.from(_product);
    } catch (e) {
      throw ("exception $e");
    }
    _isLoading = false;
    notifyListeners();
  }

  onsearch(String query) {
    if (query.isEmpty) {
      originalProducts = List.from(_product);
      notifyListeners();
      return;
    }

    if (query.length == 1) {
      _product = originalProducts.where((item) {
        return item.title.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
      notifyListeners();
      return;
    }

    _product = originalProducts.where((items) {
      return items.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
