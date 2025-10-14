// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/model/products_repository.dart';

import 'screens/about.dart';
import 'screens/cartScreen.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'colors.dart';
import 'screens/productDetailScreen.dart';
import 'supplemental/cut_corners_border.dart';

import 'backdrop.dart'; 
import 'model/product.dart'; 

import 'category_menu_page.dart';

import 'package:app_links/app_links.dart';


// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);
  @override
    State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  // Menyimpan kategori aktif
  Category _currentCategory = Category.all;

  // Deeplink handler
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();

    // Menangkap deep link saat aplikasi sedang aktif
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri == null) return;
      _handleDeepLink(uri);
    });

    // Menangkap deep link saat aplikasi dibuka dari luar
    _handleInitialUri();
  }

  // Fungsi untuk handle deep link
  void _handleDeepLink(Uri uri) {
    // Misal: grafix://product/2
    if (uri.host == 'product') {
      final productId =
          uri.pathSegments.isNotEmpty ? int.tryParse(uri.pathSegments[0]) : null;

      if (productId != null) {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: productId,
        );
      }
    }
  }

  Future<void> _handleInitialUri() async {
    final Uri? uri = await _appLinks.getInitialAppLink();
    if (uri != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleDeepLink(uri);
      });
    }
  }

  // Callback saat kategori dipilih
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRAFIX',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
              currentCategory: _currentCategory,
              frontLayer: HomePage(category: _currentCategory),
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('GRAFIX'),
              backTitle: const Text('MENU'),
            ),
        '/cart': (BuildContext context) => const CartScreen(),
        '/about': (context) => AboutScreen(),
      },

      // Route khusus Product Detail
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          if (settings.arguments is int) {
            final id = settings.arguments as int;
            final product = ProductsRepository.loadProducts(Category.all)
                .firstWhere((p) => p.id == id);
            return MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            );
          }
        }
        return null;
      },

      theme: _kShrineTheme,
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();
// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBlue900,
        bodyColor: kShrineBlue900,
      );
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrineBlue100,
      onPrimary: kShrineBlue900,
      secondary: kShrineBlue900,
      error: kShrineErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrineBlue100,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kShrineBlue900,
      backgroundColor: kShrineBlue100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBlue900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBlue900,
      ),
    ),
  );
}
// TODO: Build a Shrine Text Theme (103)