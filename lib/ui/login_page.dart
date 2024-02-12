import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream/service/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleAuth auth = GoogleAuth();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: ElevatedButton(
              child: Text('Sign in with Google'),
              onPressed: () async {
                User? user = await auth.signInWithGoogle();
                if (user != null) {
                  // Navigate to your desired screen after authentication
                  print('Signed in: ${user.displayName}');
                } else {
                  print('Sign in failed');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
