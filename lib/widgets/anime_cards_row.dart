import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/anime_bloc.dart';
import 'anime_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimeCardsRow extends StatefulWidget {
  @override
  State<AnimeCardsRow> createState() => _AnimeCardsRowState();
}

class _AnimeCardsRowState extends State<AnimeCardsRow> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AnimeListBloc>(context, listen: false);

    return Consumer<AnimeListBloc>(
      builder: (context, animeListBloc, child) {
        if (animeListBloc.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (animeListBloc.error.isNotEmpty) {
          return Center(
            child: Text(animeListBloc.error),
          );
        }
        final animeList = animeListBloc.animeList;
        return CarouselSlider(
          items: animeList.map<Widget>((anime) {
            return AnimeCard(anime: anime);
          }).toList(),
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
          ),
        );
      },
    );
  }
}
