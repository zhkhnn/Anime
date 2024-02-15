import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stream/ui/anime_list.dart';
import '../bloc/app_blocs.dart';
import '../bloc/app_events.dart';
import '../bloc/app_states.dart';
import '../models/anime.dart';
import '../repos/repositories.dart';

class SearchAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(
        RepositoryProvider.of<AnimeRepo>(context),
      )..add(LoadAnimeEvent()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search for anime',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        Navigator.pop(context); // Pop the navigator
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Center(
                  child: Text(
                    'Search Results',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              BlocBuilder<AnimeBloc, AnimeState>(
                builder: (context, state) {
                  if (state is AnimeLoadedState) {
                    print('data loaded');
                    List<Anime> animeList = state.animeList;
                    return AnimeListPage(animeList: animeList);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
