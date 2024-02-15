import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/anime.dart';
import '../models/saved_animes.dart';
import '../repos/repositories.dart';
import 'package:stream/widgets/youtube_trailer_video.dart';
import 'package:stream/service/save_manager.dart';

class AnimeDetailPage extends StatefulWidget {
  final Anime anime;

  AnimeDetailPage({required this.anime});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  void _saveAnime(BuildContext context, Anime anime) async {
    try {
      await Save_Manager.saveAnime(SavedAnime(
        id: anime.id,
        title: anime.title,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Anime saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save anime')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.anime.title),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _saveAnime(context, widget.anime);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300, // Set the height as needed
                  child: Image.network(
                    widget.anime.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Title: ${widget.anime.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popularity: ${widget.anime.popularity}'),
                    Text('Duration: ${widget.anime.duration}'),
                  ],
                ),
                Text(
                  widget.anime.status,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                Text(
                  'Producer is ${widget.anime.producer}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                Text(
                  'Aired in  ${widget.anime.year} year',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                Container(
                  child: YoutubeTrailerPlayer(
                      animeTrailerUrl: widget.anime.trailerId),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
