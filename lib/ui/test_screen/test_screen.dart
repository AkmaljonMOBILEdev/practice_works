import 'package:flutter/material.dart';
import 'package:main_project/data/status/form_status.dart';
import 'package:provider/provider.dart';

import '../../app_provider/user_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          actions: [
            IconButton(
              onPressed: () {
                provider.fetchUsers();
              },
              icon: const Icon(
                Icons.download,
              ),
            )
          ],
        ),
        body: Center(
            child: provider.status == FormStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Text(
                      "${provider.users.first.name.title} ${provider.users.first.name.first} ${provider.users.first.name.last}",
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )));
  }
}
