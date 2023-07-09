import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/models/game_model.dart';
import 'package:main_project/ui/game_screen/game_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem({super.key, required this.gameModel});
  final GameModel gameModel;
  
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
        onTap: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context){
                return GameScreen(gameModel: gameModel);
              }));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          width: 350.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.amberAccent
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350.w,
                height: 170.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(gameModel.thumbnail, fit: BoxFit.cover,),
                ),
              ),
              Text(gameModel.title)
            ],
          ),
          
          
        ), 
    );
  }
}
