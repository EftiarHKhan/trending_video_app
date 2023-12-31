import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trending Videos",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Initialize Home page"),
        ),
      ),
    );
  }
}
