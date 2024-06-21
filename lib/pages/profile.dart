import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  const Profile({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Handle back button press
                Navigator.pop(context, true);
              },
            ),
            Text(
              'Kembali',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/images/fendy.png"), // Replace with actual image URL
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fendy Wijaya',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit button press
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'hello_world@binus.ac.id', // Replace with actual email
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Male',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                // Handle copy userID button press
              },
              child: Text('copy userID'),
            ),
          ],
        ),
      ),
    );
  }
}