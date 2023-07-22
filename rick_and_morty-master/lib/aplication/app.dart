import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/screens/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rick and Morty Characters", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: const Center(
          child: Home(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}