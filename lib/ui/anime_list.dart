import 'package:flutter/material.dart';
import 'package:stream/bloc/anime_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stream/models/anime.dart';
import 'anime_detail.dart';
import 'package:stream/widgets/anime_tile.dart';

class AnimeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AnimeListBloc>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Free To Watch',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: bloc.fetchAnimeListDisplay(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Anime> animeList = snapshot.data as List<Anime>;
              return ListView.builder(
                itemCount: animeList.length,
                itemBuilder: (context, index) {
                  final anime = animeList[index];
                  return AnimeTile(anime: anime);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
