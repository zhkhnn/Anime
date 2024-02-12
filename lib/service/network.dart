import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  Future<List<dynamic>> fetchAnimeList() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/anime'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> animeList = data['data'];
      return animeList;
    } else {
      throw Exception('Failed to fetch anime list');
    }
  }
}
