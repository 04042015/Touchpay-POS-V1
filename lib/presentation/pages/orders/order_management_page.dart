import 'package:flutter/material.dart';
import '../../widgets/common/app_bar_widget.dart';

class OrderManagementPage extends StatelessWidget {
  const OrderManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Manajemen Pesanan'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Manajemen Pesanan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Halaman manajemen pesanan sedang dalam pengembangan'),
          ],
        ),
      ),
    );
  }
}