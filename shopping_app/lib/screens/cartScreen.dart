import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.items.isEmpty? 
      const Center(
        child: Text('Your Cart is Empty'),
      ): 
      ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final product = cart.items[index];
          return ListTile(
            leading: Image.asset(product.assetName, width: 56),
            title: Text(product.name),
            subtitle: Text(product.hargaRupiah),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                cart.remove(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: 
        Text(
          'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
