import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:shrine/supplemental/product_card.dart';
// import 'supplemental/asymmetric_view.dart';
import '../model/product.dart';
import '../model/products_repository.dart';
import '../colors.dart';

import 'cartScreen.dart';
import 'about.dart';

class HomePage extends StatefulWidget{
  final Category category;
  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  // Untuk sementara, halaman yang akan muncul di tiap tab:
  late final List<Widget> _pages;
 
  @override
  void initState() {
    super.initState();
    _pages = [
      _buildProductGrid(), 
      const CartScreen(),
      AboutScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // fungsi buat tampilan produk
  Widget _buildProductGrid() {
    final products = ProductsRepository.loadProducts(widget.category);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            //implementasi navigasi
            onTap: () {
              print('Navigating to product id: ${product.id}');
              Navigator.pushNamed(
                context,
                '/product',
                arguments: product.id,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: kShrineBlue900,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
