import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = AuthService();

  bool loading = false;

  void register() async {

    setState(() => loading = true);

    try {

      await auth.register(
        emailController.text,
        passwordController.text,
      );

      Navigator.pop(context);

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );

    }

    setState(() => loading = false);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('HabitFlow'),
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: loading ? null : register,
                child: Text(
                  loading ? 'Loading...' : 'Register',
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
