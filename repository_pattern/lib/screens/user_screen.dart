import 'package:flutter/material.dart';
import 'package:repository_pattern/data/repositories/user_repository.dart';

import '../models/user.dart';

class UserScreen extends StatefulWidget {
  final UserRepository repository;

  UserScreen(this.repository);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> _userFuture; 

  @override
  void initState() {
    super.initState();
    _userFuture = widget.repository.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thêm Scaffold để giao diện chuẩn
      appBar: AppBar(title: Text("Users")),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _userFuture, // Sử dụng biến đã khởi tạo
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) return Text("Error: ${snapshot.error}");

            final users = snapshot.data!;
            return ListView.builder(
              // Dùng ListView.builder sẽ mượt hơn
              itemCount: users.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(users[index].name)),
            );
          },
        ),
      ),
    );
  }
}
