import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warungrama/keranjang.dart';
import 'package:warungrama/widget/listWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map> pesanan = [];
List<Map> data = [
  {
    'jenis': 'Ayam',
    'nama': 'Ayam Suir',
    'harga': 12000,
    'gambar': '1.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Ayam',
    'nama': 'Ayam Betutu',
    'harga': 12000,
    'gambar': '2.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Telur',
    'nama': 'Telor Bacem',
    'harga': 12000,
    'gambar': '3.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Telur',
    'nama': 'Telur Gulung',
    'harga': 12000,
    'gambar': '4.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Bebek',
    'nama': 'Bebek Bawang Putih',
    'harga': 12000,
    'gambar': '5.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Bebek',
    'nama': 'Lalapan Bebek',
    'harga': 12000,
    'gambar': '6.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Sate',
    'nama': 'Sate Kacang',
    'harga': 12000,
    'gambar': '7.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Sate',
    'nama': 'Sate Pusut',
    'harga': 12000,
    'gambar': '8.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Soto',
    'nama': 'Soto Ayam',
    'harga': 15000,
    'gambar': '9.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  },
  {
    'jenis': 'Soto',
    'nama': 'Soto Daging',
    'harga': 12000,
    'gambar': '10.jpg',
    'rating': '4.5',
    'waktu': '10 menit'
  }
];

String formatRupiah(int value) {
  final formatCurrency = NumberFormat.currency(locale: 'id', symbol: 'Rp ');

  return formatCurrency.format(value);
}

class _HomePageState extends State<HomePage> {
  Color primaryColor = const Color.fromARGB(255, 125, 196, 68);

  saveData(int quantity, int index) {
    if (pesanan.isEmpty) {
      pesanan.add({
        'nama': logika()![index]['nama'],
        'harga': logika()![index]['harga'],
        'jumlah': quantity,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Pesanan ditambahkan ke keranjang'),
      ));
    } else if (pesanan
        .any((element) => element['nama'] == data[index]['nama'])) {
      index = pesanan
          .indexWhere((element) => element['nama'] == data[index]['nama']);
      pesanan[index]['jumlah'] = pesanan[index]['jumlah'] + quantity;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pesanan berhasil ditambahkan'),
        ),
      );
    } else {
      pesanan.add({
        'nama': logika()![index]['nama'],
        'harga': logika()![index]['harga'],
        'jumlah': quantity,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Pesanan ditambahkan ke keranjang'),
      ));
    }
  }

  List<Map>? dataPesanan = [];

  logika() {
    if (dataPesanan!.isEmpty) {
      dataPesanan = data;
      return dataPesanan;
    } else {
      return dataPesanan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 125, 196, 68),
        title: const Row(
          children: [
            Icon(
              Icons.restaurant_menu_sharp,
              size: 26.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 3.0,
            ),
            Text(
              "Menu Utama",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeranjangPage()),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              )),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 20,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 125, 196, 68),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                            style: const TextStyle(
                              color: Color.fromARGB(255, 125, 196, 68),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                hintText: "cari makanan seleramu..",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  dataPesanan = data;
                                });
                              } else {
                                setState(() {
                                  dataPesanan = data
                                      .where((element) => element['nama']
                                          .toString()
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: logika().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  content: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 300,
                                      width: 600,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 34, 34, 34),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/${logika()![index]['gambar']}",
                                                width: 120.0,
                                                height: 120.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                logika()![index]['nama'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                logika()![index]['jenis'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              const Icon(
                                                Icons.star,
                                                size: 18.0,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                logika()![index]['rating'],
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              Text(
                                                logika()![index]['waktu'],
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                formatRupiah(logika()![index]
                                                        ['harga'])
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  saveData(1, index);
                                                  print(pesanan);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Pesan",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              });
                        },
                        child: ListWidget(
                          color: primaryColor,
                          gambar: logika()![index]['gambar'],
                          harga: formatRupiah(logika()![index]['harga'])
                              .toString(),
                          jenisMakanan: logika()![index]['jenis'],
                          rating: logika()![index]['rating'],
                          namaMakanan: logika()![index]['nama'],
                          waktu: logika()![index]['waktu'],
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
