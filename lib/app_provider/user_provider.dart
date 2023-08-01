import 'package:flutter/foundation.dart';
import 'package:main_project/data/models/free_user_model/results_model/results_model.dart';
import 'package:main_project/data/models/universal_data.dart';
import 'package:main_project/data/network/providers/api_provider.dart';
import 'package:main_project/data/status/form_status.dart';

class UserProvider with ChangeNotifier{
  UserProvider(){
    fetchUsers();
  }

  List<ResultsModel> users = [];
  FormStatus status = FormStatus.pure;
  String errorText='';

  fetchUsers()async{
    notify(FormStatus.loading);
    UniversalData universalData = await ApiProvider().getUserInfo();
    if(universalData.error.isEmpty){
      notify(FormStatus.success);
      users = universalData.data as List<ResultsModel>;
    }else{
      errorText=universalData.error.toString();
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value){
    status=value;
    notifyListeners();
  }

}