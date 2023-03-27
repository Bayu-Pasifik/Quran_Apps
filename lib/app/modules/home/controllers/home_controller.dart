import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quran_apps/app/data/models/surah_model.dart';

class HomeController extends GetxController {
  // List<dynamic>

  Future<List<SurahModel>> getAllSurah() async {
    Uri url = Uri.parse('https://api-quran-ruddy.vercel.app/surah');
    var response = await http.get(url);
    var data = json.decode(response.body)['data'] as List;
    var tempdata = data.map((e) => SurahModel.fromJson(e)).toList();
    print(tempdata);
    return tempdata;
    // listTrending.addAll(tempdata);
    // print("page : $page");
    // print("total : $totalPage");
  }
}
