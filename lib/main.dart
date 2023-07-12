import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_project/ui/home_screen/home_screen.dart';
import 'package:main_project/utils/theme.dart';

import 'data/local/storage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),

    );
  }
}
