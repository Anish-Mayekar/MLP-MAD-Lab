// import 'package:flashcards_quiz/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              // Placeholder image or user's profile picture
              backgroundImage: AssetImage('assets/xyz.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Email: test1@gmail.com',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Password: test1@123',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

            // Add more profile details as needed
          ],
        ),
      ),
      //  bottomNavigationBar: BottomNavBar(
      //   selectedIndex: selectedIndex,
      //   onItemTapped: onItemTapped,
      // ),
    );
  }
}
