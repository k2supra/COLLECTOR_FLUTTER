import 'package:flutter/material.dart';

class HobbyScreen extends StatelessWidget {
  final List<Map<String, dynamic>> hobbies = [
    {'icon': Icons.computer, 'text': 'IT      '},
    {'icon': Icons.music_note, 'text': 'Sport'},
  ];

  HobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biography: About hobby'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var hobby in hobbies)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(hobby['icon']),
                  const SizedBox(width: 10),
                  Text(hobby['text']),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
