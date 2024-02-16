import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream/di/injection.dart';
import 'package:stream/repos/repositories.dart';
import 'package:stream/ui/home_page.dart';
import 'service/firebase_options.dart';
import 'ui/login_page.dart';
import 'package:provider/provider.dart';
import 'package:stream/ui/anime_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectGetIt();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final isAuthed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  final isAuthed = false;

  @override
  void initState() {
    super.initState();

    if (isAuthed) {
      HomePage();
    } else {
      LoginPage(
        isAuth: isAuthed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
