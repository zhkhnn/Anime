import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AnimeEvent extends Equatable {
  const AnimeEvent();
}

class LoadAnimeEvent extends AnimeEvent {
  @override
  List<Object?> get props => [];
}

class LoadAnimeDetailEvent extends AnimeEvent {
  final int animeId;

  const LoadAnimeDetailEvent({required this.animeId});

  @override
  List<Object> get props => [animeId];

  int get id => 1;
}
