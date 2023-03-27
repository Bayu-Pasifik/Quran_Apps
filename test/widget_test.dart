import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_apps/app/data/models/surah_model.dart';

void main() async {
  Uri url = Uri.parse('https://api-quran-ruddy.vercel.app/surah');
  var response = await http.get(url);

  var data = json.decode(response.body)['data'];
  // page = json.decode(response.body)['page'];
  // totalPage = json.decode(response.body)['total_pages'];
  var tempdata = data.map((e) => SurahModel.fromJson(e)).toList();
  print(tempdata);
  // listTrending.addAll(tempdata);
  // print("page : $page");
  // print("total : $totalPage");
}
