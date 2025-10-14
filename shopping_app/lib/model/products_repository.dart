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

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.Poster,
        id: 1001,
        isFeatured: true,
        name: 'Poster Gudeg Yogya',
        price: 25000000,
        assetName: 'assets/img/Produk1.png',
      ),

      Product(
        category: Category.Poster,
        id: 1002,
        isFeatured: true,
        name: 'Poster Samber Gelap Island',
        price: 15000,
        assetName: 'assets/img/Produk2.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1003,
        isFeatured: true,
        name: 'Poster Majukan Indonesia',
        price: 15000,
        assetName: 'assets/img/Produk3.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1004,
        isFeatured: true,
        name: 'Poster Kesehatan Mata',
        price: 15000,
        assetName: 'assets/img/Produk4.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1005,
        isFeatured: true,
        name: 'Poster Dive into English Literacy ',
        price: 120,
        assetName: 'assets/img/Produk5.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1006,
        isFeatured: true,
        name: 'Poster Thrive',
        price: 15000,
        assetName: 'assets/img/Produk6.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3001,
        isFeatured: true,
        name: 'Poster Oprec',
        price: 15000,
        assetName: 'assets/img/Produk7.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3002,
        isFeatured: true,
        name: 'Poster Hari Pendidikan',
        price: 12000,
        assetName: 'assets/img/Produk8.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1007,
        isFeatured: true,
        name: 'Poster Missing',
        price: 18000,
        assetName: 'assets/img/Produk9.png',
      ),
      
      Product(
        category: Category.Youtube,
        id: 2001,
        isFeatured: true,
        name: 'Thumbnail YT Cinamatic',
        price: 20000,
        assetName: 'assets/img/Produk10.png',
      ),
      
      Product(
        category: Category.Youtube,
        id: 2002,
        isFeatured: true,
        name: 'Thumbnail YT Podcast',
        price: 20000,
        assetName: 'assets/img/Produk11.png',
      ),
      
      Product(
        category: Category.Poster,
        id: 1008,
        isFeatured: true,
        name: 'Halftone Poster',
        price: 15000,
        assetName: 'assets/img/Produk12.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3003,
        isFeatured: true,
        name: 'Carousel Scrapbook Theme',
        price: 20000,
        assetName: 'assets/img/Produk13.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3004,
        isFeatured: true,
        name: 'IGS Poster',
        price: 10000,
        assetName: 'assets/img/Produk14.png',
      ),
      
      Product(
        category: Category.Lainnya,
        id: 501,
        isFeatured: true,
        name: 'Game Signboard',
        price: 15000,
        assetName: 'assets/img/Produk15.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3005,
        isFeatured: true,
        name: 'Hari Buruh',
        price: 20000,
        assetName: 'assets/img/Produk16.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4001,
        isFeatured: true,
        name: 'Minmalist Semi Pixel',
        price: 15000,
        assetName: 'assets/img/Produk17.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4002,
        isFeatured: true,
        name: 'Vintage English Newspaper',
        price: 15000,
        assetName: 'assets/img/Produk18.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4003,
        isFeatured: true,
        name: 'Indonesian Theme',
        price: 15000,
        assetName: 'assets/img/Produk19.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4004,
        isFeatured: true,
        name: 'MV Dinosaur by AKMU',
        price: 17000,
        assetName: 'assets/img/Produk20.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4005,
        isFeatured: true,
        name: 'Y2K Retro Teck',
        price: 15000,
        assetName: 'assets/img/Produk21.png',
      ),
      
      Product(
        category: Category.PPT,
        id: 4006,
        isFeatured: true,
        name: 'Minimalist Black n White',
        price: 15000,
        assetName: 'assets/img/Produk22.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3006,
        isFeatured: true,
        name: 'Elysian Explores',
        price: 20000,
        assetName: 'assets/img/Produk23.png',
      ),

      Product(
        category: Category.Poster,
        id: 1009,
        isFeatured: true,
        name: 'Restart',
        price: 1000,
        assetName: 'assets/img/Produk24.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3007,
        isFeatured: true,
        name: 'Hari Pancasila',
        price: 15000,
        assetName: 'assets/img/Produk25.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3008,
        isFeatured: true,
        name: 'Minimalist 1',
        price: 5000,
        assetName: 'assets/img/Produk26.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3009,
        isFeatured: true,
        name: 'Feeds Web Theme',
        price: 10000,
        assetName: 'assets/img/Produk27.png',
      ),
      
      Product(
        category: Category.Lainnya,
        id: 502,
        isFeatured: true,
        name: 'Karya Ilimiah Remaja',
        price: 30000,
        assetName: 'assets/img/Produk28.png',
      ),

      Product(
        category: Category.IG,
        id: 3010,
        isFeatured: true,
        name: 'Feeds FairyTale Theme',
        price: 20000,
        assetName: 'assets/img/Produk29.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3011,
        isFeatured: true,
        name: 'Feeds Beach Theme',
        price: 20000,
        assetName: 'assets/img/Produk30.png',
      ),
      
      Product(
        category: Category.IG,
        id: 3012,
        isFeatured: true,
        name: 'Carousel',
        price: 35000,
        assetName: 'assets/img/Produk31.png',
      ),

      Product(
        category: Category.Lainnya,
        id: 503,
        isFeatured: true,
        name: 'Desain Tumblr',
        price: 20000,
        assetName: 'assets/img/Produk32.png',
      ),

      Product(
        category: Category.Poster,
        id: 1010,
        isFeatured: true,
        name: 'Poster Beach Theme',
        price: 30000,
        assetName: 'assets/img/Produk33.png',
      ),

      Product(
        category: Category.Lainnya,
        id: 504,
        isFeatured: true,
        name: 'Game Signboard Purple Forest',
        price: 15000,
        assetName: 'assets/img/Produk34.png',
      ),

      Product(
        category: Category.Lainnya,
        id: 505,
        isFeatured: true,
        name: 'Game Signboard Main Forest',
        price: 15000,
        assetName: 'assets/img/Produk35.png',
      ),

      Product(
        category: Category.Lainnya,
        id: 506,
        isFeatured: true,
        name: 'Frame Photobooth',
        price: 99999,
        assetName: 'assets/img/Produk36.png',
      ),
      
      Product(
        category: Category.Lainnya,
        id: 507,
        isFeatured: true,
        name: 'Rangkuman Fisika',
        price: 29999,
        assetName: 'assets/img/Produk37.png',
      ),

      Product(
        category: Category.IG,
        id: 3013,
        isFeatured: true,
        name: 'Poster Kartini',
        price: 15000,
        assetName: 'assets/img/Produk38.png',
      ),

    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
