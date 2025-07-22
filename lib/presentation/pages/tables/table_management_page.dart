import 'package:flutter/material.dart';
import '../../widgets/common/app_bar_widget.dart';

class TableManagementPage extends StatelessWidget {
  const TableManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Manajemen Meja'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.table_restaurant, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Manajemen Meja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Halaman manajemen meja sedang dalam pengembangan'),
          ],
        ),
      ),
    );
  }
}