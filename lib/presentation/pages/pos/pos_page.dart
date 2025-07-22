import 'package:flutter/material.dart';
import '../../widgets/common/app_bar_widget.dart';

class PosPage extends StatelessWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Point of Sale'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.point_of_sale, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'POS Interface',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Halaman POS sedang dalam pengembangan'),
          ],
        ),
      ),
    );
  }
}