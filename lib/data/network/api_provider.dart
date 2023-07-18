import 'dart:convert';

import 'package:main_project/utils/constants.dart';
import 'package:http/http.dart';

class ApiProvider{
  Future<String> getWord({
    required String word, required String first, required String second})async{
    Uri uri = Uri.https(baseUrl,
      "/get",
      {
        "q":word,
        "langpair":"$first|$second"
      }
    );
    // https://api.mymemory.translated.net/get?q=ended&langpair=en|uz

        Response response = await get(uri);
        if(response.statusCode==200){
          String wordTr =  jsonDecode(response.body)["responseData"]["translatedText"] as String;
          print('word is $wordTr');
          return wordTr;
        }
        return "";

  }
}