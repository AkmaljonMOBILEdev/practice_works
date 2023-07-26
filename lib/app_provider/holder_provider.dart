import 'package:flutter/foundation.dart';

class HolderProvider with ChangeNotifier{
  bool what = false;
  changeState(){
    what=what?false:true;
    notifyListeners();
  }

}