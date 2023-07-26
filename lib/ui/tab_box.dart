import 'package:flutter/material.dart';
import 'package:main_project/app_provider/page_changer.dart';
import 'package:main_project/ui/first_screen.dart';
import 'package:main_project/ui/second_screen.dart';
import 'package:main_project/ui/third_screen.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];
  int currentIndex = 0;

  @override
  void initState() {
    screens.addAll([FirstScreen(), SecondScreen(), ThirdScreen()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageChanger>(context);
    return Scaffold(
      body: screens[pageProvider.get],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.black,
        // selectedIconTheme: IconThemeData(size: 50, color: Colors.yellow),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        iconSize: 36,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        // showSelectedLabels: true,
        onTap: (index) {
          pageProvider.changerPage(index);
        },
        currentIndex: pageProvider.get,
        items: [
          BottomNavigationBarItem(
            label: "1",
            icon: Icon(Icons.one_k),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_k),
            label: ""
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.three_k),
          ),
        ],
      ),
    );
  }
}
