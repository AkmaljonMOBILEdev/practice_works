import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({super.key});

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  List<bool> isSelectedList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15);
        },
        itemBuilder: (BuildContext context, int index) {
          return getContainer("${index + 1}", index);
        },
      ),
    );
  }

  Widget getContainer(String number, int index) {
    return ZoomTapAnimation(
      onTap: () {
        setState(() {
          isSelectedList[index] = !isSelectedList[index];
        });
      },
      child: Container(
        width: 150,
        height: 20,
        color: isSelectedList[index] ? Colors.blue : Colors.grey,
        child: Center(
          child: Text(number),
        ),
      ),
    );
  }
}

