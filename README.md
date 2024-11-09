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


# Tugas 8

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan  
   kapan sebaiknya tidak digunakan?
    Penggunaan const di Flutter sangat penting untuk efisiensi performa dan pengelolaan memori. Ketika kita menggunakan const, objek yang dibuat menjadi immutable, artinya objek tersebut tidak bisa diubah setelah dibuat, sehingga sering dipakai untuk widget atau elemen UI yang bersifat statis. Keuntungannya, objek const hanya diciptakan sekali di memori dan bisa digunakan berulang tanpa perlu membuat salinan baru. Ini tentu menghemat penggunaan memori dan mempercepat rendering UI karena widget yang diberi label const tidak perlu dibangun ulang setiap kali tampilan diperbarui. Di sisi lain, karena const dapat diketahui lebih awal oleh Flutter, proses kompilasi pun bisa lebih optimal, menjadikan aplikasi lebih efisien.

    Namun, const sebaiknya hanya digunakan pada elemen-elemen yang sifatnya tidak berubah, seperti teks, ikon, atau pengaturan tetap (misalnya warna dan ukuran). Di sisi lain, const kurang tepat jika digunakan pada objek yang bergantung pada input dinamis pengguna atau kondisi aplikasi. Contohnya, data yang diambil dari API atau variabel yang bisa berubah-ubah tergantung interaksi pengguna tidak bisa diberi label const.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
    Column adalah widget yang menyusun elemen-elemen anaknya secara vertikal, dari atas ke bawah. Gunakan Column jika kamu ingin menata beberapa elemen secara bertingkat ke bawah. Sebaliknya, Row menyusun elemen-elemen anaknya secara horizontal, dari kiri ke kanan. Row cocok dipakai saat kamu ingin elemen-elemen tampil sejajar dalam satu baris. Kedua widget ini sangat berguna untuk mengatur tata letak elemen-elemen di layar sesuai dengan kebutuhan desain.
    contoh implementasi row:
    ```dart
    Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(title: 'NPM', content: npm),
            InfoCard(title: 'Name', content: name),
            InfoCard(title: 'Class', content: className),
          ],
        ),
    ```
    hasil implementasi row:
    ![](static/images/row.png)
    contoh implementasi column:
    ```dart
    Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(content),
      ],
    ),
    ```
    hasil implementasi row:
    ![](static/images/column.png)    
3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain 
   yang tidak kamu gunakan pada tugas ini? Jelaskan!
   Pada form yang saya buat, ada tiga elemen input utama:

    -Item: Menggunakan TextFormField untuk input teks yang mewakili nama produk
    -Picture link: Menggunakan TextFormField untuk input teks yang mewakili foto produk yang diambil dari link
    -harga: Menggunakan TextFormField  dengan validasi agar hanya angka yang diterima.
    -Description: Menggunakan TextFormField untuk deskripsi produk
     Ada beberapa elemen input lain yang seharusnya bisa digunakan namun tidak saya pilih untuk tugas ini, seperti:

    1. Checkbox: Untuk memilih opsi atau persetujuan.
    2. Radio: Untuk pilihan tunggal dalam satu grup.
    3. Switch: Untuk mengaktifkan atau menonaktifkan pengaturan.
    4. DropdownButton: Untuk memilih dari daftar pilihan.
    5. Slider: Untuk memilih nilai dalam rentang tertentu.
    6. DatePicker: Untuk memilih tanggal.


4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada 
   aplikasi yang kamu buat?
    Ya, saya telah mengimplementasikan tema di aplikasi yang saya buat. Tema diatur menggunakan ThemeData dalam properti theme pada MaterialApp di file main.dart. Warna utama dan sekunder diatur melalui ColorScheme. Misalnya, saya menetapkan primarySwatch ke Colors.yellow dan warna sekunder ke warna kuning yang lebih terang untuk menciptakan konsistensi visual di seluruh aplikasi.

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
    Dalam aplikasi ini, saya menggunakan metode Navigator.push dan Navigator.pop untuk navigasi antar halaman. Navigator.push menambahkan halaman baru ke dalam stack navigasi, sehingga halaman tersebut menjadi halaman aktif di atas halaman sebelumnya. Pengguna masih bisa kembali ke halaman sebelumnya menggunakan Navigator.pop, yang menghapus halaman aktif dari stack dan membawa pengguna kembali ke halaman sebelumnya. Untuk mempermudah navigasi, saya juga menambahkan sebuah drawer di aplikasi.

