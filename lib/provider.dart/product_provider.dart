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
  bool get isLoading => _isLoading;

// method

  loadingData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _product = await _service.fetchData();
    } catch (e) {
      throw ("exception $e");
    }
    _isLoading = false;
    notifyListeners();
  }
}
