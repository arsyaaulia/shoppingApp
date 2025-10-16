import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/model/cart_model.dart';

import '../model/product.dart';
import '../model/products_repository.dart';
// import '../model/products_repository.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product? product;

  const ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final int productId = ModalRoute.of(context)!.settings.arguments as int;
    final product = ProductsRepository.loadProducts(Category.all).firstWhere((p) => p.id == productId);

    return Scaffold(
      

      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: product == null
            // placeholder
            ? const Center(
                child: Text(
                  'Produk tidak ditemukan',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      product.assetName,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    product.hargaRupiah,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: kShrineBlue900,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final cart = context.read<CartModel>();
                            cart.add(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product.name} add to cart')),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kShrineBlue200,
                            foregroundColor: kShrineBlue900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('All Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kShrineBlue200,
                            foregroundColor: kShrineBlue900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
