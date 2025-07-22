import 'package:flutter/material.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Awal'),
      ),
      body: const Center(
        child: Text('Setup Page - Coming Soon'),
      ),
    );
  }
}