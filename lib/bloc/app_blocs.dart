import 'package:stream/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/anime.dart';
import 'app_states.dart';
import 'app_events.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepo _anime_repository;

  AnimeBloc(this._anime_repository) : super(AnimeLoadingState()) {
    on<LoadAnimeEvent>(
      (event, emit) async {
        emit(AnimeLoadingState());
        try {
          final animeList = await _anime_repository.getAnime();
          emit(AnimeLoadedState(animeList: animeList, anime: animeList.first));
        } catch (e) {
          throw Exception("allsls");
        }
      },
    );
    on<LoadAnimeDetailEvent>((event, emit) async {
      emit(AnimeLoadingState());
      try {
        final anime = await _anime_repository.getAnimeDetail(event.id);
        emit(AnimeLoadedState(animeList: [], anime: anime));
      } catch (e) {
        emit(AnimeErrorState(error: e.toString()));
      }
    });
  }
}
