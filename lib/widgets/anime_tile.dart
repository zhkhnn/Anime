import 'package:flutter/material.dart';
import 'package:stream/models/anime.dart';
import 'package:stream/ui/anime_detail.dart';

class AnimeTile extends StatelessWidget {
  final Anime anime;
  AnimeTile({required this.anime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anime.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnimeDetailPage(anime: anime)),
        );
      },
    );
  }
}
