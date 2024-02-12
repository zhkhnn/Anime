import 'package:flutter/material.dart';
import 'package:stream/service/network.dart';
import 'package:stream/models/anime.dart';

class AnimeListBloc extends ChangeNotifier {
  final Network _network = Network();
  List<Anime> _animeList = [];
  bool _isLoading = false;
  String _error = '';

  List<Anime> get animeList => _animeList;
  bool get isLoading => _isLoading;
  String get error => _error;

  AnimeListBloc() {
    fetchAnimeListDisplay();
  }

  Future<void> fetchAnimeListDisplay() async {
    try {
      _error = '';
      notifyListeners();

      final List<dynamic> animeListData = await _network.fetchAnimeList();
      _animeList = animeListData.map((data) => Anime.fromJson(data)).toList();
    } catch (e) {
      _error = 'Failed to fetch anime list on bloc';
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
