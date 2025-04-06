import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent,
        title: const Text("Home"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, color: Colors.red, size: 100),
            const SizedBox(height: 8),
            const Text("Home", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 12),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                context.goNamed("SubHome");
              },
              child: const Text(
                "Navigate To Sub Home View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
