import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/models/game_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.gameModel});
  final GameModel gameModel;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
        backgroundColor: Colors.amberAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.amberAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(widget.gameModel.thumbnail, fit: BoxFit.cover,)),
                ),
                SizedBox(width: 8.w,),
                Text(widget.gameModel.title,
                style: Theme.of(context).textTheme.titleMedium,)

              ],
            ),
            SizedBox(height: 4.h,),
            RichText(text: TextSpan(
              text: 'Company : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: widget.gameModel.developer,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: 'Genre : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: widget.gameModel.genre,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: 'Support platforms : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: widget.gameModel.platform,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: 'Release date : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: widget.gameModel.releaseDate,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: 'Description : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: widget.gameModel.shortDescription,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: 'Link to download : ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Uri.parse(widget.gameModel.freeToGame),
                  text: widget.gameModel.freeToGame,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
          ],
        ),
      ),
    );
  }
}
