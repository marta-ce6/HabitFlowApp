import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitflow/main.dart';
import 'package:habitflow/screens/habits_screen.dart';
import 'package:habitflow/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logout(BuildContext context) async {
    final auth = AuthService();
    await auth.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
      builder: (context) => const MyHomePage(title: 'HabitFlow'),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HabitFlow Home"),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Logged in as: ${FirebaseAuth.instance.currentUser?.email ?? 'Unknown'}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HabitsScreen(),
                  ),
                );
              },
              child: const Text("Go to Habits"),
            ),

          ],
        ),
      ),
    );
  }
}

