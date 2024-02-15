import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream/service/google_auth.dart';
import 'package:stream/ui/home_page.dart';
import 'package:stream/ui/profile_page.dart';

class LoginPage extends StatelessWidget {
  GoogleAuth auth = GoogleAuth();
  late final bool isAuth;
  LoginPage({required this.isAuth});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<User?>(
      future: auth.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while checking authentication status
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            // User is authenticated, navigate to HomePage
            return HomePage();
          } else {
            return Center(
              child: ElevatedButton(
                child: Text('Sign in with Google'),
                onPressed: () async {
                  User? user = await auth.signInWithGoogle();
                  if (user != null) {
                    // Navigate to your desired screen after authentication
                    print('Signed in: ${user.displayName}');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    isAuth = true;
                  } else {
                    print('Sign in failed');
                    isAuth = false;
                  }
                },
              ),
            );
          }
        }
        ;
      },
    ));
  }
}
