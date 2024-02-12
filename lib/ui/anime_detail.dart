import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/anime.dart';

class AnimeDetailPage extends StatelessWidget {
  final Anime anime;

  AnimeDetailPage({required this.anime});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(anime.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: size.width,
                height: size.height, // Set the height as needed
                child: Image.network(
                  anime.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Title: ${anime.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popularity: ${anime.popularity}'),
                  Text('Duration: ${anime.duration}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
