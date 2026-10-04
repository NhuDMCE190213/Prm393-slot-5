import 'package:flutter/material.dart';

import '../services/stream_service.dart';

class HomeScreen extends StatelessWidget {
  final StreamService _service = StreamService();
  HomeScreen({super.key}) {
    _service.start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Counter Stream')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _service.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Có lỗi xảy ra');
            }
            if (!snapshot.hasData) {
              return const Text('Chưa có dữ liệu');
            }
            return Text(
              'Counter: ${snapshot.data}',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
    );
  }
}
