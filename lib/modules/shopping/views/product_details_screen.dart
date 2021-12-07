import 'package:flutter/material.dart';
import 'package:shop_app/modules/shopping/models/home_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${product.images}'),
      ),
    );
  }
}

// photo view