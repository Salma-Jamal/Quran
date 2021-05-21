import '../model/surahModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Q_API {
  Future<SurahsList> getSurahList() async {
    Uri url = Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return SurahsList.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }
}
