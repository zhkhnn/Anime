import 'package:http/http.dart';
import 'dart:convert';
import 'package:stream/models/anime.dart';

class AnimeRepo {
  String endpoint = 'https://api.jikan.moe/v4/anime';
  Future<List<Anime>> getAnime() async {
    try {
      Response response = await get(Uri.parse(endpoint),
          headers: {"content-type": "application/json"});
      print(response);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        print(result);
        return result.map(((e) => Anime.fromJson(e))).toList();
      } else {
        print("data = error");
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print("data = error=$e");
      throw Exception("adadas");
    }
  }

  Future<Anime> getAnimeDetail(int id) async {
    try {
      Response response = await get(Uri.parse('$endpoint/$id'));
      if (response.statusCode == 200) {
        final animeData = jsonDecode(response.body)['data'];
        final anime = Anime.fromJson(animeData);
        return anime;
      } else {
        throw Exception('error response');
      }
    } catch (e) {
      throw Exception('anime error');
    }
  }
}
