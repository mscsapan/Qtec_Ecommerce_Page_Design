import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';
import 'dart:async';

class NetworkApi {
  final String uri =
      'https://panel.primebazar.com/api/product-core/suzuki-gsx-r150-fi-dual-channel-abs-yvj2/0/?format=json';

  Future<List<Product>> getProduct() async {
    try {
      http.Response response = await http.get(Uri.parse(uri));
      List<Product> product = [];
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        Product data = Product.fromJson(json);
        product.add(data);
      }
      return product;
    } on SocketException catch (e) {
      debugPrint('SocketException found ${e.message}');
    } on FormatException catch (e) {
      debugPrint('FormatException found ${e.message}');
    } catch (e) {
      debugPrint('Others Exception found ${e.toString()}');
    }
    return getProduct();
  }
}

/*class NetworkService {
  final String uri =
      'https://panel.primebazar.com/api/product-core/suzuki-gsx-r150-fi-dual-channel-abs-yvj2/0/?format=json';

  Future<Product> product() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final Product _product = Product.fromJson(data);
      return _product;
    }
    return product();

    */ /*try {
      http.Response response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final Product _product = Product.fromJson(data);
        return _product;
      }
    } on SocketException catch (e) {
      throw Exception('SocketException found ${e.message}');
    } on FormatException catch (e) {
      throw Exception('FormatException found ${e.message}');
    } catch (e) {
      throw Exception('Others Exceptions Found ${e.toString()}');
    }*/ /*
  }
}*/
