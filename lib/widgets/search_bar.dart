import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/anime_bloc.dart';
import 'package:stream/ui/anime_list.dart';

class SearchAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for anime...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (value) {
        // You can implement search functionality here
      },
    );
  }
}
