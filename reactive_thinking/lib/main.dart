import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/counter_stream_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(CounterStreamService()..start()),
    );
  }
}