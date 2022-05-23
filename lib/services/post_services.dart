import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store/models/product_byname.dart';
import 'dart:async';

import '../models/names_model.dart';
import '../models/product_model.dart';

// ignore: non_constant_identifier_names
class ApiService {
  String url_base = 'https://sprayground.herokuapp.com/';

  Future<List<Product>?> getAllProducts() async {
    String url = "${url_base}products";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Product>?> getCategories(String category) async {
    String url = "${url_base}category/$category";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ProductByName?> getProductByName(String name) async {
    String url = "${url_base}name/$name";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        ProductByName _model = productByNameFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Product>?> getPromo() async {
    String url = "${url_base}promo";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List?> getNames() async {
    String url = "${url_base}names";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List _model = namesFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Product>?> postProduct() async {
    String url = "${url_base}/product";
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
