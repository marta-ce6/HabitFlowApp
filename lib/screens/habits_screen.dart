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
  String searchText = '';

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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(

              decoration: const InputDecoration(
                hintText: "Search habits...",
                prefixIcon: Icon(Icons.search),
              ),

              onChanged: (value) {

                setState(() {
                  searchText = value.toLowerCase();
                });

              },

            ),
          ),

          StreamBuilder(
            stream: service.getHabits(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }

              if (!snapshot.hasData) {
                return const SizedBox(height: 60);
              }

              final docs = snapshot.data!.docs;

              int completed = 0;

              for (var doc in docs) {
                final data = doc.data() as Map<String, dynamic>;
                if (data['done'] == true) {
                  completed++;
                }
              }

              double progress =
                  docs.isEmpty ? 0 : completed / docs.length;

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    Text(
                      "Completed habits: $completed / ${docs.length}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 10),

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ],
                ),
              );
            },
          ),

          Expanded(
            child: StreamBuilder(
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
                final filteredDocs = docs.where((doc) {

                  final data = doc.data() as Map<String, dynamic>;

                  final name =
                      data['name'].toString().toLowerCase();

                  return name.contains(searchText);

                }).toList();

                filteredDocs.sort((a, b) {

                  final aData = a.data() as Map<String, dynamic>;
                  final bData = b.data() as Map<String, dynamic>;

                  bool aFavorite = aData['isImportant'] ?? false;
                  bool bFavorite = bData['isImportant'] ?? false;

                  if (aFavorite && !bFavorite) {
                    return -1;
                  }

                  if (!aFavorite && bFavorite) {
                    return 1;
                  }

                  return 0;
                });

                if (filteredDocs.isEmpty) {
                  return const Center(
                    child: Text(
                      "No habits yet. Add your first one!",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {

                    final doc = filteredDocs[index];
                    final data = doc.data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(data['name']),
                      subtitle: Text(
                      data['createdAt'] != null
                          ? data['createdAt'].toDate().toString().split(' ')[0]
                          : '',
                    ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Checkbox(
                            value: data['done'],
                            onChanged: (_) {
                              service.toggleHabit(doc.id, data['done']);
                            },
                          ),

                          IconButton(
                            tooltip: "Mark as favorite",
                            icon: Icon(
                              data['isImportant'] == true
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                              service.toggleImportant(
                                doc.id,
                                data['isImportant'] ?? false,
                              );
                            },
                          ),
                          IconButton(
                            tooltip: "Delete habit",
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              service.deleteHabit(doc.id);
                            },
                          ),

                        ],
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