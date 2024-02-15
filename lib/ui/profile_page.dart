import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stream/service/google_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // late final String username;
  // late final String avatar;
  //
  // ProfilePage({this.avatar = '', this.username = ''});
  @override
  Widget build(BuildContext context) {
    GoogleAuth auth = GoogleAuth();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Aruzhan Zhakhan',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('zhakhanaruzhan@gmail.com',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  auth.signOutFromGoogle();
                  print('logged out');
                },
                child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
}
