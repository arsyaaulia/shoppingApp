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
import 'package:intl/intl.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/screens/productDetailScreen.dart';

import '../model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {this.imageAspectRatio = 33 / 49, 
      required this.product, 
      Key? key, required Null Function() onTap})
      : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Product product;

  static const kTextBoxHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    final imageWidget = AspectRatio(
      aspectRatio: imageAspectRatio,
      child: Image.asset(
        product.assetName,
        fit: BoxFit.cover,
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product)),
        );
      }, // Tambahkan handler navigasi jika perlu
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Batasi gambar product agar pas dalam grid
            Expanded(child: imageWidget),

            // Bagian teks (nama dan harga)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.hargaRupiah,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: kShrineBlue900
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
