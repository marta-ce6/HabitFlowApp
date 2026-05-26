import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const HabitFlow());
}

class HabitFlow extends StatelessWidget {
  const HabitFlow({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitFlow',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 192, 28),),

      appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 23, 183, 17),
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 18,
    ),
  ),
),
      home: const LoginScreen(), //const MyHomePage(title: 'HabitFlow Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: const Text('HabitFlow'),),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to HabitFlow',style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10),
            Text('HabitFlow progress counter: $_counter',style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Habit progress',
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
