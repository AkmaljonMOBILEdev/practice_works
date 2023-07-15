import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StepButton extends StatelessWidget {
  const StepButton({super.key,  required this.title, this.isFirst=true});
  final bool isFirst;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        width: 134.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: isFirst?AppColors.cFCA600:AppColors.c0083FC.withOpacity(.7),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(.2, 4),
              color: Colors.black.withOpacity(.2)
            )
          ]
        ),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w800, fontFamily: 'Spartan', color: AppColors.cFFFFFF
          ),),
        ),
      ),
    );
  }
}
