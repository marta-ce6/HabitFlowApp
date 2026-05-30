import 'package:flutter/material.dart';
import '../services/habit_service.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {

  final service = HabitService();
  final controller = TextEditingController();

  void addHabit() async {
    if (controller.text.isEmpty) return;

    await service.addHabit(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Habits")),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "New habit",
                    ),
                  ),
                ),

                IconButton(
                  onPressed: addHabit,
                  icon: const Icon(Icons.add),
                )

              ],
            ),
          ),

          Expanded(
            child: StreamBuilder(
              stream: service.getHabits(),
              builder: (context, snapshot) {

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {

                    final doc = docs[index];
                    final data = doc.data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(data['name']),
                      trailing: Checkbox(
                        value: data['done'],
                        onChanged: (_) {
                          service.toggleHabit(doc.id, data['done']);
                        },
                      ),
                    );

                  },
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}