import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/data/models/prayer_times_model.dart';
import 'package:main_project/data/models/times_model.dart';
import 'package:main_project/data/network/api_provider.dart';
import 'package:main_project/data/network/times_repository.dart';
import 'package:main_project/utils/colors.dart';
import 'package:main_project/utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PrayerTimesModel? times;
  bool isLoading = false;
  List<String> names = ["Bomdod", "Quyosh","Peshin","Asr", "Shom", "Xufton"];


  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    times = await TimesRepository().fetchTimes("Toshkent");
    setState(() {
      isLoading = false;
    });
  }
  String formatDateTime(String dateString) {
    DateTime date = DateTime.parse(dateString);

    String daySuffix = 'th';
    if (date.day == 1 || date.day == 21 || date.day == 31) {
      daySuffix = 'st';
    } else if (date.day == 2 || date.day == 22) {
      daySuffix = 'nd';
    } else if (date.day == 3 || date.day == 23) {
      daySuffix = 'rd';
    }

    String formattedDate = DateFormat("d'$daySuffix' MMMM").format(date);
    return formattedDate;
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          title:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h,),
              Text(times!.region,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20.sp, color: AppColors.c0B2812, fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 4.h,),
              Text("${times!.weekday}, ${formatDateTime(times!.date)}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18.sp, color: AppColors.c0B2812, fontWeight: FontWeight.w500
              ),),
            ],
          ),
          actions: [
            IconButton(onPressed: (){},
                icon: SvgPicture.asset(AppIcons.menu), color: AppColors.c0B2812,),
            SizedBox(width: 12.w,)
          ],
        ),
        body: isLoading
          ? const Center(child: CircularProgressIndicator(),)
          : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
              width: 312.w,
              height: 122.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: AppColors.c0B2812.withOpacity(.92)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bomdod",style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.cFFFFFF
                  ),),
                  SizedBox(height: 20.h,),
                  Text(times!.times.tong, style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.cFFFFFF
                  ),)
                ],
              ),
            ),
            ...List.generate(6, (index) {
              return getTimes(index, times!.times.tong);
            })

          ],
        )

    );
  }

  getTimes(int index,String time){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      width: 312.w,
      height: 52.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: index==0?AppColors.c0B2812:AppColors.c024B38.withOpacity(.4)
      ),
      child: Row(
        children: [
          Text(names[index], style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: index==0?AppColors.cFFFFFF:AppColors.c0B2812
          ),),
          Spacer(),
          Text(time, style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: index==0?Colors.white:AppColors.c0B2812
          ),)
        ],
      ),
    );
  }
}
