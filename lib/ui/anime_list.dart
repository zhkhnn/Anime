import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/models/anime.dart';
import 'anime_detail.dart';
import 'package:stream/widgets/anime_tile.dart';

class AnimeListPage extends StatelessWidget {
  AnimeListPage({required this.animeList});
  final List<Anime> animeList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        final anime = animeList[index];
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: AnimeTile(anime: anime),
        );
      },
    );
  }
}
