import 'package:flutter/material.dart';
import 'login_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                const url = 'https://www.instagram.com/dwina.dia';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text('About App'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPages();
                  },
                ));
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
