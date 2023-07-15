import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/utils/colors.dart';

class ImageHolderBanner extends StatelessWidget {
  const ImageHolderBanner(
      {super.key, required this.image, required this.num, required this.title});

  final String image;
  final String num;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 372.w,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 30,
            child: Row(
              children: [
                Text(
                  '#$num',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.cFC7CFF,
                      fontFamily: 'Spartan'),
                ),
                Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.c000000,
                      fontFamily: 'Spartan'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              width: 370.w,
              height: 204.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.cFC7CFF,
                    AppColors.cFA5AFD,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 20,
              right: 60,
              left: 60,
              child: SizedBox(
                  width: 280.w,
                  height: 356.h,
                  child: Image.network(image, fit: BoxFit.cover,)))
        ],
      ),
    );
  }
}
