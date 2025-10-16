# Refleksi ShoppingApp: Grafix
Grafix merupakan platform digital yang menyediakan jasa Desain Grafis. Jasa yang ditawarkan berupa desain untuk kebutuhan pribadi, sosial media, hingga kebutuhan event. Produk atau Desain yang ditampilkan merupakan beberapa Desain yang telah tim pengembang buat selama ini.

## A. Struktur Root dan Navigasi
Untuk root dan navigasi 

## B. Masalah dan Solusi
Dalam proses pengerjaan Grafix, tim pengembang menghadapi beberapa masalah. Setiap masalah itu tim pengembang mencari dan menemukan solusinya masing-masing. Berikut list masalah dan solusi pada projek Grafix
Tim pengembang mengalami beberapa masalah sebagai berikut:

1. Aplikasi tidak menampilkan tampilan seharusnya. Sempat mengotak-atik folder android, tetapi tetap tidak bisa. Lalu tim pengembang mengambil langkah menghapus folder Android sesuai saran dari Ko Rei. Menjalankan `flutter run` kembali menggunakan emulator Android, program akan mendeteksi ada folder yang kurang dan akan menambahkannya kembali sesuai kebutuhan.

2. Halaman `Cart` tidak muncul sesuai dengan harapan. Disebabkan karena `CartScreen` tidak dapat menemukan data dari `<CartModel>`. Walaupun file `cart_model.dart` dan `CartScreen` sudah dibuat, keduanya belum terhubung melalui Provider. Dalam Flutter, Provider berfungsi untuk membuat data seperti CartModel dapat diakses secara global oleh semua halaman. Tanpa Provider, setiap halaman hanya mengenali salinannya sendiri, bukan data yang sama secara bersama. Karena itu, perlu menambahkan Provider di `main.dart` agar `CartModel` dapat digunakan secara konsisten di seluruh aplikasi.

3. Potongan kode `'/product': (context) => ProductDetailScreen()` tidak bisa menggunakan `route` biasa, perlu menggunakan `onGenerateRoute`. `/product` membutuhkan argument, sedangkan `route` tidak dapat secara langsung menerima argumen. Jadi khusus untuk `/product` dibuatkan route terpisah sebagai berikut:
```dart
    onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          // bisa kirim id (int) atau object Product
          if (settings.arguments is int) {
            //teirma id
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
```

4. Repository bermasalah. Terdapat subrepo di dalam repository. Hal ini disebabkan karena tim pengembang melakukan copas folder sekaligus repository VisproWeek3. Sebagai solusi saya meminta bantuan kepada AI (ChatGPT, Gemini), teman-teman (Michele, Ce Inno), serta kating (Ko Gibek). Tapi pada akhirnya saya memutuskan membuat repo baru saja.

5. Aplikasi tidak bisa jalan saat menjalankan `flutter run` di repo baru. Sudah mencoba hapus folder Android, tetapi tidak berhasil. Takut salah ambil langkah seperti masalah sebelumnya, saya meminta bantuan kepada Ko Rei. Setelah konsul, hal ini disebabkan Gradle yang rewel. Solusi yang diambil meliputi langkah berikut
    - `rm -rf ~/.gradle/daemon/`
    - `rm -rf ~/.gradle/caches/`
    - `flutter clean`
    - `flutter pub get`
    - `flutter run`

6. Android emulator terbuka tetapi masih dengan pembaruan lama saat `flutter run`. Saat jalankan `flutter run` kembali, progress stuck di pesan `E/AndroidRuntime(29716): ... 14 more`. Meminta bantuan kepada Ko Rei dan pesan berganti gradle yang bermasalah. Sebagai solusi, uninstall gradle lalu download kembali gradle. Hasilnya masih sama, emulator tidak berjalan. Tim pengembang tidak bisa melakukan test terhadap adb-nya.

Kesimpulannya, solusi yang tim pengembang lakukan saat mendapatkan masalah adalah meminta saran atau bantuan dari berbagai sumber. 

## C. How deep linking can improve the usability and discoverability of your app.
Dengan deep link 

## D. Fitur yang akan Ditambahkan Selanjutnya
Untuk tahap pengembangan selanjutnya, tim pengembang akan menambahkan fitur profile user dan fitur checkout.
___

