// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warungrama/home.dart';
import 'package:warungrama/onboarding.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<Map> data = pesanan;
  String formatRupiah(int value) {
    final formatCurrency = NumberFormat.currency(locale: 'id', symbol: 'Rp ');

    return formatCurrency.format(value);
  }

  totalHarga() {
    int total = 0;
    for (var i = 0; i < data.length; i++) {
      total += data[i]['harga'] * data[i]['jumlah'] as int;
    }
    return total;
  }

  Color primaryColor = const Color.fromARGB(255, 125, 196, 68);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        title: Text(
          "Keranjang",
          style: TextStyle(color: primaryColor),
        ),
        actions: const [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'x${data[index]['jumlah']} ${data[index]['nama']}',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 18),
                              ),
                            ),
                            Text(
                              formatRupiah(data[index]['harga']),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              formatRupiah(
                                  data[index]['harga'] * data[index]['jumlah']),
                              style: const TextStyle(
                                  color: Colors.yellow, fontSize: 18),
                            )
                          ],
                        )),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (data[index]['jumlah'] > 1) {
                                    setState(() {
                                      data[index]['jumlah']--;
                                    });
                                  } else {
                                    setState(() {
                                      data.removeAt(index);
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    data[index]['jumlah']++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text('TOTAL :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 6.0,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatRupiah(totalHarga()),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (data.isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 34, 34, 34),
                                title: Text(
                                  'Pesanan dibuat!',
                                  style: TextStyle(color: primaryColor),
                                ),
                                content: SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Makanan anda akan segera diantarkan ke meja anda :)',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      const Text('data pesanan anda :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      Expanded(
                                        child: SizedBox(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                for (int i = 0;
                                                    i < data.length;
                                                    i++)
                                                  Text(
                                                    'x${data[i]['jumlah']} ${data[i]['nama']}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Total : ${formatRupiah(totalHarga())}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          data.clear();
                                        });
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OnBoarding()),
                                        );
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 24),
                                      ))
                                ],
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Keranjang kosong!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text(
                      'Pesan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
