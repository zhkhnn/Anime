import 'package:flutter/cupertino.dart';
import 'package:stream/service/save_manager.dart';
import 'package:flutter/material.dart';
import 'package:stream/models/saved_animes.dart';

class SaveAnimeList extends StatefulWidget {
  const SaveAnimeList({super.key});

  @override
  State<SaveAnimeList> createState() => _SaveAnimeListState();
}

class _SaveAnimeListState extends State<SaveAnimeList> {
  List<SavedAnime> _savedAnime = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _loadSavedAnime();
    });
  }

  Future<void> _loadSavedAnime() async {
    final savedAnime = await Save_Manager.getSavedAnime();
    setState(() {
      _savedAnime = savedAnime;
    });
  }

  Future<void> _deleteAnime(int id) async {
    try {
      await Save_Manager.deleteAnime(id);
      setState(() {
        _loadSavedAnime();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Anime deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete anime')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SavedAnime>>(
        future: Save_Manager.getSavedAnime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No saved anime.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final savedAnime = snapshot.data![index];
                return ListTile(
                  title: Text(savedAnime.title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteAnime(savedAnime.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
