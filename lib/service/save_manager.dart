import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream/models/saved_animes.dart';

class Save_Manager {
  static const _key = 'saved_anime';
  static Future<List<SavedAnime>> getSavedAnime() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedAnimeJson = prefs.getString(_key);
    if (savedAnimeJson != null) {
      final List<dynamic> savedAnimeData = jsonDecode(savedAnimeJson);
      return savedAnimeData.map((e) => SavedAnime.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> saveAnime(SavedAnime anime) async {
    final prefs = await SharedPreferences.getInstance();
    final List<SavedAnime> savedAnime = await getSavedAnime();
    savedAnime.add(anime);
    final String savedAnimeJson = jsonEncode(savedAnime);
    await prefs.setString(_key, savedAnimeJson);
  }

  static Future<void> deleteAnime(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<SavedAnime> savedAnime = await getSavedAnime();
    savedAnime.removeWhere((anime) => anime.id == id);
    final String savedAnimeJson = jsonEncode(savedAnime);
    await prefs.setString(_key, savedAnimeJson);
  }
}
