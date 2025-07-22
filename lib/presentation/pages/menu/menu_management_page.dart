import 'package:flutter/material.dart';
import '../../widgets/common/app_bar_widget.dart';

class MenuManagementPage extends StatelessWidget {
  const MenuManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Manajemen Menu'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Manajemen Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Halaman manajemen menu sedang dalam pengembangan'),
          ],
        ),
      ),
    );
  }
}