import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/utils/colors.dart';

class PokemonSearch extends StatelessWidget {
  const PokemonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 60.w,
        vertical: 32.h
      ),
      width: 296.w,
      height: 42.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.cE5E5E5
      ),
      child: Center(
        child: Text('Buscar Pokémon', style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w400, color: AppColors.c838282
        ),),
      ),
    );
  }
}
