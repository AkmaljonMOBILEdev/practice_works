import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/data/models/pokemon_model.dart';
import 'package:main_project/ui/detail_screen/widgets/details_holder.dart';
import 'package:main_project/ui/detail_screen/widgets/image_holder.dart';
import 'package:main_project/ui/detail_screen/widgets/step_button.dart';
import 'package:main_project/utils/colors.dart';

import '../../utils/icons.dart';
import '../home_screen/widgets/search_button.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({super.key, required this.game});

  final PokemonModel game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 53.h,
              ),
              Center(
                child: SizedBox(
                  width: 252.w,
                  height: 88.h,
                  child: Image.asset(
                    AppIcons.pokemon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 32.h,),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(AppIcons.arrowBack)),
                  const Spacer(),
                  Container(
                    width: 228.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppColors.cE5E5E5),
                    child: Center(
                      child: Text(
                        'Buscar Pokémon',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.c838282),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.filter),
                  )
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(22.w),
                child: ImageHolderBanner(image: game.img, num: game.num, title: game.name),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepButton(title: 'Fuego'),
                  Spacer(),
                  StepButton(title: "Volador",isFirst: false,)
                ],
              ),
              SizedBox(height: 25.h,),
              DetailsHolderBanner(game: game)
            ],
          ),
        ),
      ),
    );
  }
}
