import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/anime.dart';

@immutable
abstract class AnimeState extends Equatable {}

class AnimeLoadingState extends AnimeState {
  @override
  List<Object?> get props => [];
}

class AnimeLoadedState extends AnimeState {
  AnimeLoadedState({required this.animeList, required this.anime});
  final List<Anime> animeList;
  final Anime anime;
  @override
  List<Object?> get props => [animeList, anime];
}

class AnimeErrorState extends AnimeState {
  AnimeErrorState({required this.error});
  final String error;
  @override
  List<Object?> get props => [error];
}
