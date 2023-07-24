import 'dart:convert';

import 'package:http/http.dart';
import 'package:main_project/data/models/data_model.dart';
import 'package:main_project/data/models/uni_response.dart';


class ApiProvider{
  Future<UniversalResponse> fetchInfo({required int page, required int count})async{
    Uri uri = Uri.parse("https://api.instantwebtools.net/v1/passenger?page=2&size=10");
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        print("DATA: ${response.body}");
        return UniversalResponse(
          data: (jsonDecode(response.body)["data"]as List?)
              ?.map((e) => DataModel.fromJson(e)).toList() ?? []
        );
      }
      return UniversalResponse(error: "Error");
    }catch(e){
      return UniversalResponse(error: e.toString());
    }
  }
}

// Uri uri = Uri.https(
//   baseUrl,
//   "/search",
//   {
//     "q": query,
//     "page": page.toString(),
//     "num": count.toString(),
//     "gl":"uz"
//   },
// );