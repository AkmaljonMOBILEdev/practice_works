import 'package:flutter/material.dart';
import 'package:main_project/data/models/free_user_model/results_model/results_model.dart';
import 'package:main_project/data/models/universal_data.dart';
import 'package:main_project/data/network/providers/api_provider.dart';

class UserProvider with ChangeNotifier{
  bool isLoading=false;
  ResultsModel? resultsModel;
  List<ResultsModel> list=[];

    get getUserInfo async{
    whichState();
    UniversalData universalData = await ApiProvider().getUserInfo();
    if(universalData.error.isEmpty){
      list.addAll(universalData.data);
    }
    whichState();
    return list;
    }

  whichState(){
    isLoading=!isLoading;
    notifyListeners();
  }
}