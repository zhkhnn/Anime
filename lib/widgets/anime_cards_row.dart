import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/anime.dart';
import 'anime_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimeCardsRow extends StatelessWidget {
  final List<Anime> anime;
  AnimeCardsRow({required this.anime});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: anime.map<Widget>((anime) {
        return AnimeCard(anime: anime);
      }).toList(),
      options: CarouselOptions(
        height: 150,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
