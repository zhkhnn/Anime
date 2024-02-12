import 'package:flutter/material.dart';
import 'package:stream/widgets/anime_card.dart';
import 'package:stream/widgets/search_bar.dart';
import 'package:stream/widgets/anime_cards_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Anime App'),
        ),
        body: Column(
          children: [
            SearchAnime(),
            SizedBox(height: 16),
            AnimeCardsRow(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
