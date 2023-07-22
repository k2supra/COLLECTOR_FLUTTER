import 'package:flutter/material.dart';

class CollegeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> colleges = [
    {'emoji': Icons.school, 'text': 'VTFK       '},
    {'emoji': Icons.forest, 'text': '1 course'},
  ];

  CollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biography: About college'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var col in colleges)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(col['emoji']),
                  ),
                  //Icon(col['emoji']),
                  const SizedBox(width: 10,),
                  Text(col['text']),
                ],
              )
          ],
        )
      )
    );
  }
}