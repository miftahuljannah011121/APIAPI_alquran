import 'dart:convert';
import 'package:http/http.dart' as http;
import 'quranModel.dart';
import 'surahModel.dart';

class HttpService {
  final String _baseUrl = 'https://quran-api.santrikoding.com/api';

  Future<List<QuranModel>> getSurah() async {
    final response = await http.get(Uri.parse('$_baseUrl/surah'));

    if (response.statusCode == 200) {
      List<QuranModel> surah = (jsonDecode(response.body) as List)
          .map((json) => QuranModel.fromJson(json))
          .toList();
      return surah;
    } else {
      throw Exception('Failed to load surah');
    }
  }

  Future<SurahModel> dataSurah(int nomor) async {
    final response = await http.get(Uri.parse('$_baseUrl/surah/$nomor'));

    print('Fetching Surah $nomor...');
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}'); // Debugging untuk melihat isi API

    if (response.statusCode == 200) {
      return SurahModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
