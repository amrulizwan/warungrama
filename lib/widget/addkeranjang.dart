import 'package:flutter/material.dart';

class OrderQuantityDialog extends StatefulWidget {
  const OrderQuantityDialog({super.key});

  @override
  _OrderQuantityDialogState createState() => _OrderQuantityDialogState();
}

class _OrderQuantityDialogState extends State<OrderQuantityDialog> {
  int quantity = 1;

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  List<Map> pesanan = [];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Jumlah Pesanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: decreaseQuantity,
                ),
                const SizedBox(width: 16.0),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: increaseQuantity,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('+ Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
