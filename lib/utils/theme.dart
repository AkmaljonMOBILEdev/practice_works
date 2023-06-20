import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class AppTheme{

  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.cFFFFFF,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.cFFFFFF,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.cFFFFFF,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      textTheme: const TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.c000000,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins'
          ),
          displayMedium: TextStyle(
              color: AppColors.c000000,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          displaySmall: TextStyle(
              color: AppColors.c000000,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.c000000,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          headlineMedium: TextStyle(
              color: AppColors.c000000,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          headlineSmall: TextStyle(
              color: AppColors.c000000,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.c000000,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          titleMedium: TextStyle(
              color: AppColors.c000000,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          titleSmall: TextStyle(
              color: AppColors.c000000,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.c000000,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          labelMedium: TextStyle(
              color: AppColors.c000000,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          labelSmall: TextStyle(
              color: AppColors.c000000,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.c000000,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodyMedium: TextStyle(
              color: AppColors.c000000,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodySmall: TextStyle(
              color: AppColors.c000000,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          )

      )
  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.c000000,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.c000000,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.c000000,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light
          )
      ),
      textTheme: const TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins'
          ),
          displayMedium: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          displaySmall: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          headlineMedium: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          headlineSmall: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'
          ),
          titleMedium: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          titleSmall: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
          ),
          labelMedium: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          labelSmall: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodyMedium: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          bodySmall: TextStyle(
              color: AppColors.cFFFFFF,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          )

      )
  );
}