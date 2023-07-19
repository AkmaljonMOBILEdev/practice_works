import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetUserInfo extends StatelessWidget {
  const GetUserInfo({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 16.w,),
        Expanded(
          child: Text(title, style: TextStyle(
            fontSize: 20.sp,
            color: Colors.deepPurple

          ),),
        )
      ],
    );
  }
}
