import 'package:flutter/cupertino.dart';

class PageChanger with ChangeNotifier{
   int _index=0;

  changerPage(int value){
    _index=value;
    notifyListeners();
  }

  get get => _index;

}