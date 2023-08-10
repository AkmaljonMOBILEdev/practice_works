import 'package:flutter/material.dart';
import 'package:main_project/app_provider/holder_provider.dart';
import 'package:main_project/app_provider/page_changer.dart';
import 'package:main_project/ui/tab_box.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageChanger(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => HolderProvider(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox(),
    );
  }
}
