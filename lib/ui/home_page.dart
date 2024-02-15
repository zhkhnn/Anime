import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stream/bloc/app_blocs.dart';
import 'package:stream/bloc/app_events.dart';
import 'package:stream/bloc/app_states.dart';
import 'package:stream/repos/repositories.dart';
import 'package:stream/ui/anime_list.dart';
import 'package:stream/ui/home_container.dart';
import 'package:stream/ui/profile_page.dart';
import 'package:stream/ui/saved_anime_list.dart';
import 'package:stream/widgets/anime_card.dart';
import 'package:stream/widgets/anime_display.dart';
import 'package:stream/widgets/search_bar.dart';
import 'package:stream/widgets/anime_cards_row.dart';

import '../models/anime.dart';
import '../widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(
        RepositoryProvider.of<AnimeRepo>(context),
      )..add(LoadAnimeEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Anime App'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAnime()),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            AnimeDisplay(),
            SaveAnimeList(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomMenu(
          currentIndex: currentIndex,
          onItemTapped: (new_index) {
            setState(() {
              currentIndex = new_index;
            });
          },
        ),
      ),
    );
  }
}
