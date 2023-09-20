import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  String jenisMakanan;
  Color color;
  String gambar;
  String namaMakanan;
  String rating;
  String waktu;
  String harga;
  ListWidget({
    super.key,
    required this.gambar,
    required this.color,
    required this.jenisMakanan,
    required this.namaMakanan,
    required this.rating,
    required this.waktu,
    required this.harga,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 34, 34, 34),
      ),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jenisMakanan,
              style: TextStyle(color: color),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                namaMakanan,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 18.0,
                  color: Colors.yellow,
                ),
                Text(
                  rating,
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
                  waktu,
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
                const SizedBox(
                  width: 6.0,
                ),
                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                )
              ],
            )
          ],
        ),
        const Spacer(),
        Image.asset(
          "assets/$gambar",
          width: 120.0,
          height: 120.0,
          fit: BoxFit.fill,
        ),
      ]),
    );
  }
}
