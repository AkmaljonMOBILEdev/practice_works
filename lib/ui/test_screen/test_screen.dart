import 'package:flutter/material.dart';
import 'package:main_project/ui/test_screen/user_provider.dart';
// import 'package:main_project/app_provider/user_provider.dart';
// import 'package:main_project/app_provider/user_provider.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Center(
        child: Text(provider.getUserInfo),
      ),
    );
  }
}
