import 'package:flutter/material.dart';
import 'package:repository_pattern/data/datasources/user_fake_datasource.dart';

import 'data/repositories/user_repository.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(UserRepositoryImpl(UserFakeDataSource())),
    );
  }
}