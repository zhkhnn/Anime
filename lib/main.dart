import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stream/ui/home_page.dart';
import 'service/firebase_options.dart';
import 'ui/login_page.dart';
import 'package:provider/provider.dart';
import 'package:stream/bloc/anime_bloc.dart';
import 'package:stream/ui/anime_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimeListBloc(),
      child: MaterialApp(
        title: 'Anime App',
        home: SafeArea(child: HomePage()),
      ),
    );
  }
}
