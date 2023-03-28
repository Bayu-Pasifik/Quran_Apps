import 'package:get/get.dart';
import 'package:quran_apps/app/data/models/detaail_surah.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetails(int id) async {
    Uri url = Uri.parse('https://api-quran-ruddy.vercel.app/surah/$id');
    var response = await http.get(url);
    var data = json.decode(response.body)['data'];
    var tempdata = DetailSurah.fromJson(data);
    print(tempdata.numberOfVerses);
    return tempdata;
  }
}
