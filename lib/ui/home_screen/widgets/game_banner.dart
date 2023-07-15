import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/ui/detail_screen/game_detail_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/pokemon_model.dart';
import '../../../utils/colors.dart';

class GameBanner extends StatelessWidget {
  const GameBanner({
    super.key, required this.game,

  });
  final PokemonModel game;



  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GameDetailScreen(game: game)));
      },
      child: Stack(children: [
        Positioned(
          right: 0,
          left: 0,
          bottom: 4,
          child: Container(
            width: 178.w,
            height: 116.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: const LinearGradient(colors: [
                  AppColors.cFC7CFF,
                  AppColors.cFA5AFD,
                ])),
          ),
        ),
        Positioned(
          right: 12.w,
          left: 12.w,
          top: 120.h,
          bottom: 12.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            width: 128.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.c676767
            ),
            child: Row(
              children: [
                Text('#${game.num}', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w800, color: AppColors.cF993FB, fontFamily: 'Spartan'
                ),),
                Spacer(),
                Text(game.name, style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w800, color: AppColors.cFFFFFF, fontFamily: 'Spartan'
                ),)
              ],
            ),
          ),
        ),
        Positioned(right: 0, left: 0, bottom: 18, child: Image.network(game.img)),
      ]),
    );
  }
}
