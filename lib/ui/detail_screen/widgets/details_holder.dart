import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/data/models/pokemon_model.dart';
import 'package:main_project/utils/colors.dart';
import 'package:main_project/utils/icons.dart';

class DetailsHolderBanner extends StatelessWidget {
  const DetailsHolderBanner({super.key, required this.game});
  final PokemonModel game;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      height: 310.h,
      width: 414.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(60.r)
        ),
        color: AppColors.cFA5AFD
      ),
      child: Stack(
        children:[ 
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 42.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Altura", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                    ),),
                    SizedBox(height: 10.h,),
                    Text(game.height, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 15.sp,
                      fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                    ),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categoría", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                    ),),
                    SizedBox(height: 10.h,),
                    Text("Llama",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15.sp,
                        fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                    ),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Debilidad", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                    ),),
                    SizedBox(height: 10.h,),
                    Text("${game.weaknesses[0]}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15.sp,
                          fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                      ),),
                    SizedBox(height: 10.h,),
                    Text("${game.weaknesses[1]}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15.sp,
                          fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                      ),),
                    SizedBox(height: 10.h,),
                    Text("${game.weaknesses[2]}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15.sp,
                          fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                      ),),

                  ],
                ),



              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Peso", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                    ),),
                    SizedBox(height: 10.h,),
                    Text(game.weight, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 15.sp,
                        fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                    ),),
                  ],
                ),
                SizedBox(width: 48.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sexo", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                    ),),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.female),
                        SizedBox(width: 8.w,),
                        SvgPicture.asset(AppIcons.male)
                      ],
                    )
                  ],
                ),



              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 44.h,),
                Text("Habilidades", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Spartan', fontWeight: FontWeight.w800, color: AppColors.cFFFFFF
                ),),
                SizedBox(height: 10.h,),
                Text(game.candy, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15.sp,
                    fontFamily: 'Spartan', fontWeight: FontWeight.w700, color: AppColors.cFFFFFF.withOpacity(.6)
                ),),
              ],
            ),

          ],
        ),
          Positioned(
              right: 0,
              left: 160,
              bottom: 4,
              child: Image.asset(AppIcons.secondary))
      ]
      ),

    );
  }
}
