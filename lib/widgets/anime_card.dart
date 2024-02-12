import 'package:flutter/material.dart';
import 'package:stream/models/anime.dart';
import 'package:stream/ui/anime_detail.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  AnimeCard({required this.anime});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AnimeDetailPage(anime: anime)), // Navigate to AnimeDetailPage
        );
      },
      child: Card(
        color: Colors.blueGrey,
        child: Row(
          children: [
            // Leading: Image
            Expanded(
              flex: 1, // Adjust flex to control the width ratio
              child: AspectRatio(
                aspectRatio: 1, // Aspect ratio of 1 ensures square shape
                child: Image.network(
                  anime.imageUrl,
                  fit: BoxFit
                      .cover, // Cover ensures the image fills the entire space
                ),
              ),
            ),
            SizedBox(width: 8), // Add some spacing between image and text
            // Trailing: Texts
            Expanded(
              flex: 2, // Adjust flex to control the width ratio
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 8), // Add some spacing between title and duration
                  Text(
                    anime.duration,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
