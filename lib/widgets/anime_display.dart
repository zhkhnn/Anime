import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_blocs.dart';
import '../bloc/app_states.dart';
import '../models/anime.dart';
import 'anime_cards_row.dart';

class AnimeDisplay extends StatelessWidget {
  const AnimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      builder: (context, state) {
        if (state is AnimeLoadingState) {
          print('waiting');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AnimeLoadedState) {
          print('data loaded');
          List<Anime> animeList = state.animeList;
          return AnimeCardsRow(anime: animeList);
        }
        if (state is AnimeErrorState) {
          return Center(
            child: Text("error"),
          );
        }
        return Container();
      },
    );
  }
}
