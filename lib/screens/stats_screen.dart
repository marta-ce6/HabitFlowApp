import 'package:flutter/material.dart';
import '../services/habit_service.dart';

class StatsScreen extends StatelessWidget {
   StatsScreen({super.key});

  final service = HabitService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stats")),
      body: StreamBuilder(
        stream: service.getHabits(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          int total = docs.length;
          int completed = 0;
          int important = 0;

          for (var doc in docs) {
            final data = doc.data() as Map<String, dynamic>;

            if (data['done'] == true) completed++;
            if (data['isImportant'] == true) important++;
          }

          double progress = total == 0 ? 0 : completed / total;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Your Progress",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                ),

                const SizedBox(height: 20),

                Text("Total habits: $total"),
                Text("Completed: $completed"),
                Text("Pending: ${total - completed}"),
                Text("Favorites: $important"),

                const SizedBox(height: 20),

                Text(
                  "Progress: ${(progress * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(fontSize: 18),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}