import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollTimerScreen(),
    );
  }
}

class ScrollTimerScreen extends StatefulWidget {
  @override
  _ScrollTimerScreenState createState() => _ScrollTimerScreenState();
}

class _ScrollTimerScreenState extends State<ScrollTimerScreen> {
  late Timer _timer;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    // Start a timer to track 5 minutes
    _timer = Timer(Duration(minutes: 5), () {
      // Show dialog after 5 minutes
      showLoginDialog();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed (e.g., when the user logs in)
    _timer.cancel();
    super.dispose();
  }

  void showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.warning, color: Colors.red),
          content: Text('You must log in to continue.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);

                // Navigate to the login screen
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Login'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Timer Example'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
    );
  }
}