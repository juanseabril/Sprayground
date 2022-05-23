import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product_model.dart';
import '../../../services/post_services.dart';
import '../detail_page.dart';

class SearchProductDelegate extends SearchDelegate<String> {
  late final List<String> products;
  late String result;
  Product productBySearch = Product.fromJson({
    "ProductId": 0,
    "ProductName": "x",
    "ProductPrice": 0.0,
    "ProductDescription": "x",
    "ProductColor": "AC34DB",
    "ProductCategory": "x",
    "ProductImgPath": "assets/images/bags/miami/miami_black_front.png",
    "ProductStock": 0.0
  });

  SearchProductDelegate(this.products);

  @override
  String get searchFieldLabel => 'Escribe el producto ...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = products.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Center(
              child: Text(
                suggestions.elementAt(index),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {
              query = suggestions.elementAt(index);
              var finalQuery = query.replaceAll(" ", "");
              print(finalQuery);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailPage(
                        productModel: productBySearch,
                        productName: finalQuery,
                      )));
            },
            textColor: bgSignup,
            tileColor: bgLogin,
          ),
        );
      },
    );
  }
}
