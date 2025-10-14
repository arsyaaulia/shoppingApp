# Refleksi ShoppingApp
Routes and Deeplinking
## Struktur Root dan Navigasi

## Masalah dan Solusi
Saya mengalami beberapa masalah, TAPI HILANG SEMUA ITU READMENYA GEGARA REPONYA BERMASALAH HIKS. Lupa copy foldernya sebelum diperbaiki sama Ko Gibek. Ko Gibek tidak salah, saya yang salah mengira foldernya sudah saya copy, padahal belum. Jadi saya akan tuliskan masalah dan solusi yang saya ingat saja.. (masih tidak ikhlas lupa copy foldernya).

1. Aplikasi tidak menampilkan tampilan seharusnya. Sempat mengotak-atik folder android, tetapi tetap tidak bisa. Lalu saya mengambil langkah menghapus folder Android sesuai saran dari Ko Rei. Menjalankan `flutter run` kembali menggunakan emulator Android, program akan mendeteksi ada folder yang kurang dan akan menambahkannya kembali sesuai kebutuhan.

2. Halaman `Cart` tidak muncul sesuai dengan harapan. Disebabkan karena `CartScreen` tidak dapat menemukan data dari <CartModel>. Walaupun file `cart_model.dart` dan `CartScreen` sudah dibuat, keduanya belum terhubung melalui Provider. Dalam Flutter, Provider berfungsi untuk membuat data seperti CartModel dapat diakses secara global oleh semua halaman. Tanpa Provider, setiap halaman hanya mengenali salinannya sendiri, bukan data yang sama secara bersama. Karena itu, perlu menambahkan Provider di `main.dart` agar `CartModel` dapat digunakan secara konsisten di seluruh aplikasi.

3. Saat menjalankan step 1 bagian 

4. Repository saya bermasalah. Terdapat subrepo di dalam repository. Hal ini disebabkan karena saya melakukan copas folder sekaligus repository VisproWeek3. Sebagai solusi saya meminta bantuan kepada AI (ChatGPT, Gemini), teman-teman (Michele, Ce Inno), serta kating (Ko Gibek). Tapi pada akhirnya saya memutuskan membuat repo baru saja.

5. Aplikasi tidak bisa jalan saat menjalankan `flutter run` di repo baru. Takut salah ambil langkah seperti masalah sebelumnya, saya meminta bantuan kepada Ko Rei.

### Fitur yang akan Ditambahkan Selanjutnya
