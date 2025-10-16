import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/model/cart_model.dart';

import '../model/product.dart';
import '../model/products_repository.dart';
// import '../model/products_repository.dart';

class ProductDetailScreen extends StatelessWidget {
  final int? productId;

  const ProductDetailScreen({Key? key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
     // ambil argument
    final args = ModalRoute.of(context)?.settings.arguments;
    int? receivedId;
    if (args is int) {
      receivedId = args;
    } else if (args is String) {
      receivedId = int.tryParse(args);
    } else {
      receivedId = productId;
    }


    // jika tidak ada id, tampilkan placeholder
    if (receivedId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Produk tidak ditemukan')),
        body: const Center(
          child: Text(
            'Kenapa tidak muncul?',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    // kalau ada, baru ambil data produk
    final product = ProductsRepository.loadProducts(Category.all)
        .firstWhere(
          (p) => p.id == receivedId,
          orElse: () => const Product(
            category: Category.all, 
            id: -1, 
            isFeatured: false, 
            name: 'Produk tidak ditemukan', 
            price: 0, 
            assetName: 'assets/not_found.png'),
          );


    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
