import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:main_project/local/shared_preference/storage.dart';
import 'package:main_project/ui/home_screen/home_screen.dart';
import 'package:main_project/utils/theme.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en','EN'),
          Locale('ru','RU'),
          Locale('uz','UZ')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'EN'),
        child: const MyApp()),
  );
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

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
