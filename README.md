## Toko Musik John Lennon
nama : Jeremi Felix Adiyatma
NPM : 2306219575
Kelas : PBP B

# Tugas 7

# Penjelasan Kode

1. Membuat main.dart untuk base dari app yang akan dibuat. Terdapat fungsi main() untuk menjalankan widget-widget yang sudah dibuat. Serta menentukan colorScheme dari app.

```dart
import 'package:flutter/material.dart';
import 'package:toko_musik_john_lennon/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch:Colors.yellow,
        ).copyWith(secondary: Colors.yellow[400]) ,   
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

```
2. Membuat beberapa variabel final, constructor, dan list warna untuk memberikan warna yang berbeda di tiap button

```dart
final String npm = '2306219575'; // NPM
  final String name = 'Jeremi Felix Adiyatma'; // Nama
  final String className = 'PBP B'; // Kelas
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.red),
    ItemHomepage("Tambah Produk", Icons.add, Colors.blue),
    ItemHomepage("Logout", Icons.logout, Colors.green),
  ];
  MyHomePage({super.key});
```
3.Membuat class ItemHomepage yang memiliki atribut nama dan icon, dan color

```dart
final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon,this.color);
```
4. Membuat class ItemCard untuk menampung class-class ItemHomePage untuk menampung dan styling item name, icon, dan terdapat fungsi onTap() untuk menampilkan snackbar dengan fungsi built-in.
```dart
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```
5. Membuat fungsi wajib pada widget utama. Membaut 1 row untuk menampilkan npm, nama, dan kelas. Dan juga membuat GridView untuk menampilkan ItemCard dan membuat item builder yang sifatnya seperti looping untuk menampilkan masing-masing button sesuai dengan list warna yang sudah dibuat.

```dart
@override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Toko Musik John lennon',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Toko Musik John Lennon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

```

# Pertanyaan
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

    Stateless widget adalah widget yang tidak mengalami perubahan selama siklus hidupnya. Ini berarti widget ini tidak menyimpan informasi keadaan atau "state", sehingga hanya menampilkan tampilan sesuai data yang diberikan pada saat pertama kali dibuat, tanpa kemampuan beradaptasi berdasarkan interaksi atau perubahan data lebih lanjut. Tipe widget ini cocok untuk komponen statis yang tidak perlu memperbarui tampilan seiring waktu, seperti Text, Icon, dan elemen dekoratif lain yang tidak berubah meskipun ada aksi dari pengguna.

    Sebaliknya, stateful widget memiliki state atau keadaan yang bisa berubah selama interaksi dengan pengguna atau ketika data internal diperbarui. Mereka dapat memperbarui tampilan mereka setiap kali state-nya berubah, sehingga ideal untuk elemen-elemen yang perlu beradaptasi secara dinamis. Contohnya adalah formulir yang responsif terhadap input pengguna, slider interaktif, atau animasi yang perlu terus diperbarui. Setiap kali ada perubahan pada state, framework akan menggambar ulang widget tersebut sesuai data terbaru atau tindakan pengguna.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.


    1. MaterialApp Berfungsi sebagai root aplikasi Flutter dan mengatur tema, nama aplikasi, serta konfigurasi awal. Ini mengatur navigasi dan tampilan keseluruhan aplikasi.
    2. Scaffold Menyediakan struktur dasar layar, seperti AppBar, Body, dan Bottom Navigation. Di sini digunakan untuk membangun tampilan utama aplikasi.
    3. Text Menampilkan teks statis atau dinamis sesuai dengan data yang diberikan.
    4. Padding Menambahkan ruang di sekitar widget agar tampilan lebih rapi.
    5. Column Mengatur tata letak widget secara vertikal
    6. Row Mengatur tata letak secara horizontal
    7. Card Menyediakan tampilan berupa kartu dengan elevation
    8. GridView.builder Membuat tata letak berbentuk grid secara dinamis berdasarkan data yang ada.
    9. ItemCard widget kustom yang menampilkan setiap item dalam grid dengan warna latar belakang tertentu dan ikon yang sesuai.
    10. InkWell Memberikan efek ripple saat widget diketuk
    11. MediaQuery Mendapatkan informasi ukuran layar, seperti lebar perangkat agar card lebih responsive terhadap layar
    12. SnackBar Menampilkan notifikasi sementara di bagian bawah layar saat pengguna mengetuk item tertentu
    13. AppBar Header bagian atas halaman yang berisi judul aplikasi.
    14. SizedBox Memberikan jarak kosong atau memanipulasi ukuran widget.
    15. GridView.count Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap.
    16. Container Widget fleksibel untuk menyimpan elemen dan mengatur ukuran, padding, serta warna latar belakang.
    17. Material Menambahkan visual material pada widget.
    18. InfoCard (Widget/Component buatan) Widget kartu khusus untuk menampilkan informasi NPM, nama, dan kelas.
    19. Center Memposisikan widget anaknya di tengah.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    Fungsi setState() pada Flutter memberi tahu framework bahwa ada perubahan pada state widget tertentu, sehingga framework akan menggambar ulang komponen yang terpengaruh. Fungsi ini hanya dapat digunakan pada stateful widget, karena stateless widget tidak mendukung perubahan dinamis. Misalnya, jika widget membutuhkan pembaruan elemen seperti detail pengguna yang diinput, seperti nama, npm, atau kelas, setState() tidak diperlukan jika elemen-elemen tersebut dideklarasikan sebagai final, karena variabel final hanya diinisialisasi sekali dan tidak berubah sepanjang waktu.

4. Jelaskan perbedaan antara const dengan final.
    Kata kunci final digunakan untuk mendeklarasikan variabel yang hanya dapat diinisialisasi satu kali tetapi nilainya bisa ditentukan saat runtime. Sedangkan const digunakan untuk nilai yang harus ditetapkan pada saat kompilasi, sehingga sifatnya tidak dapat diubah atau "immutable". Setelah ditetapkan, baik variabel final maupun const tidak dapat diubah. Meskipun setiap const otomatis bersifat final, namun tidak semua final memenuhi syarat untuk menjadi konstanta.
